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
  if (cards < 31) {
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
  if (!packet.pilot_validation_kit?.some((item) => item.name === 'After evidence' && item.status === 'pending')) {
    throw new Error('pilot validation kit missing');
  }
  if (!packet.pilot_outreach_kit?.some((item) => item.name === 'Operator invite' && item.status === 'ready')) {
    throw new Error('pilot outreach kit missing');
  }
  if (!packet.pilot_trial_workspace || packet.pilot_trial_workspace.status !== 'pilot evidence pending') {
    throw new Error('pilot trial workspace missing default pending state');
  }
  const geminiProofMetric = await page.locator('#geminiProof').innerText();
  if (geminiProofMetric !== '1') {
    throw new Error(`unexpected Gemini proof metric: ${geminiProofMetric}`);
  }
  const defaultPilotProof = await page.locator('#pilotProof').innerText();
  if (defaultPilotProof !== '0') {
    throw new Error(`unexpected default pilot proof metric: ${defaultPilotProof}`);
  }
  const screenshot = path.join(outDir, 'coexistence-impact-engine-full.png');
  await page.screenshot({ path: screenshot, fullPage: true });
  const bytes = fs.statSync(screenshot).size;
  if (bytes < 80_000) {
    throw new Error(`screenshot too small: ${bytes}`);
  }

  await page.locator('#pilotOperator').fill('one volunteer moderator');
  await page.locator('#baselineMinutes').fill('18');
  await page.locator('#trialMinutes').fill('10');
  await page.locator('#decisionsReviewed').fill('5');
  await page.locator('#acceptedPolicy').fill('accepted after edits');
  await page.locator('#languagesUsed').fill('English, Japanese');
  await page.locator('#operatorQuote').fill('The checklist made the decision easier to explain.');
  await page.getByRole('button', { name: 'Build Impact Packet' }).click();
  const trialPacket = JSON.parse(await page.locator('#packetOutput').innerText());
  const trial = trialPacket.pilot_trial_workspace;
  if (trial.estimated_minutes_saved !== 40) {
    throw new Error(`unexpected estimated minutes saved: ${trial.estimated_minutes_saved}`);
  }
  if (trial.evidence_items_captured !== 6 || trial.status !== 'pilot evidence entered') {
    throw new Error('pilot evidence capture did not register');
  }
  console.log('impact_verify_ok');
  console.log(`cards=${cards}`);
  console.log('pilot_trial_workspace_ok');
  console.log(`screenshot=${screenshot}`);
  console.log(`bytes=${bytes}`);
} finally {
  await browser.close();
}
