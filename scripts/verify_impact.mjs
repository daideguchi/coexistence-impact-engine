import fs from 'node:fs';
import path from 'node:path';
import { chromium } from 'playwright';

const chromePath = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
const root = path.resolve('.');
const outDir = path.join(root, 'media');
fs.mkdirSync(outDir, { recursive: true });

const browser = await chromium.launch({ headless: true, executablePath: chromePath });

try {
  const page = await browser.newPage({ viewport: { width: 1440, height: 1000 } });
  await page.goto(`file://${path.join(root, 'index.html')}`, { waitUntil: 'networkidle' });
  const h1 = await page.locator('h1').innerText();
  if (h1 !== 'Coexistence Impact Engine') {
    throw new Error(`unexpected h1: ${h1}`);
  }
  await page.getByRole('button', { name: 'Build Impact Packet' }).click();
  const cards = await page.locator('.card').count();
  if (cards < 18) {
    throw new Error(`not enough cards: ${cards}`);
  }
  const prompt = await page.locator('#geminiPrompt').innerText();
  if (!prompt.includes('Do not claim to detect AI authorship')) {
    throw new Error('Gemini safety prompt missing');
  }
  const packet = JSON.parse(await page.locator('#packetOutput').innerText());
  if (packet.claim_boundary !== 'One live Gemini policy-draft call is attached. Real users, revenue, impact metrics, and final XPRIZE submission readiness are not claimed yet.') {
    throw new Error('claim boundary mismatch');
  }
  if (!packet.evidence_ledger.some((item) => item.name === 'Gemini API live proof' && item.status === 'attached')) {
    throw new Error('Gemini live proof status missing');
  }
  const geminiProofMetric = await page.locator('#geminiProof').innerText();
  if (geminiProofMetric !== '1') {
    throw new Error(`unexpected Gemini proof metric: ${geminiProofMetric}`);
  }
  const screenshot = path.join(outDir, 'coexistence-impact-engine-full.png');
  await page.screenshot({ path: screenshot, fullPage: true });
  const bytes = fs.statSync(screenshot).size;
  if (bytes < 80_000) {
    throw new Error(`screenshot too small: ${bytes}`);
  }
  console.log('impact_verify_ok');
  console.log(`cards=${cards}`);
  console.log(`screenshot=${screenshot}`);
  console.log(`bytes=${bytes}`);
} finally {
  await browser.close();
}
