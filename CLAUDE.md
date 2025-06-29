# Global CLAUDE.md

This file provides guidance to all Claude Code (claude.ai/code) instances when working on this machine.

## Updating Memory

- Always check the CLAUDE.md file in the root of the current project your working and update it with relevent changes based on recent work or discoveries
- Remove stale or unnecessary notes, sections or memories

## Git Workflow

- When prompted, check the repo for any open issues
- When working on a new issue, read and understand the requirements and make a plan
- Once the plan is complete, create a new git branch
- Work the issue
- Once the work is complete, lint the code, track all changes, commit and push that branch
- Once the branch is pushed, create a new PR referencing the issue worked. If the branch is based off of another branch, make sure the PR's base branch is set to that branch and not `main`
- If the work has included UI work for example as part of a web appliction, take approporate screenshots using the process described below and include them in your PR (multiple are welcome if well documented)

### Key Points

- Work only one github issue at a time
- Each github issue should have it's own PR, reference and fix a single issue
- If there are multiple issues to be worked, work one at a time from the lowest issue number to the highest
- The PR should always include a phrase like "fixes #1" where #1 represents the issue number being worked. This will back-link the PR to the issue and make sure the issue closed automatically when the PR is merged

## Including Screenshots in Pull Requests

### Steps

1. Create/customize `scripts/screenshot.js` for your project
2. Run `node scripts/screenshot.js` to generate screenshots in `docs/screenshots/`
3. Make sure screenshots are tracked in git
4. Embed in PR description using HTML img tags

### Generic Screenshot Script

Copy this to `scripts/screenshot.js` in any project and use with command line arguments:

**Usage:**
```bash
# Single screenshot
node scripts/screenshot.js homepage

# Custom URL  
node scripts/screenshot.js login-form http://localhost:3001

# Wait for specific selector
node scripts/screenshot.js dashboard http://localhost:3000 "button[data-testid='ready']"

# Multiple screenshots
node scripts/screenshot.js homepage,dashboard,login
```

**Script:**
```javascript
#!/usr/bin/env node
import { chromium } from 'playwright';

const args = process.argv.slice(2);
if (args.length === 0) {
  console.log('Usage: node scripts/screenshot.js <name> [url] [selector]');
  process.exit(1);
}

const names = args[0].split(',');
const url = args[1] || process.env.SCREENSHOT_URL || 'http://localhost:3000';
const waitSelector = args[2];

const CONFIG = {
  url,
  outputDir: 'docs/screenshots',
  readySelectors: waitSelector ? [waitSelector] : ['button', '[data-testid]', 'main'],
  renderDelay: 2000
};

async function waitForReady(page) {
  for (const selector of CONFIG.readySelectors) {
    try {
      await page.waitForSelector(selector, { timeout: 5000 });
      await page.waitForTimeout(CONFIG.renderDelay);
      return;
    } catch (e) {}
  }
  await page.waitForLoadState('networkidle');
}

async function takeScreenshots() {
  const browser = await chromium.launch();
  const page = await browser.newPage();
  
  await page.goto(CONFIG.url);
  await waitForReady(page);
  
  for (const name of names) {
    await page.screenshot({ 
      path: `${CONFIG.outputDir}/${name}.png`,
      fullPage: true 
    });
    console.log(`✅ Saved: ${name}.png`);
  }
  
  await browser.close();
}

takeScreenshots().catch(console.error);
```

### Key Points

- Use command line arguments instead of editing the script
- Multiple screenshots: comma-separated names 
- Custom URLs and wait selectors supported
- Make sure `@playwright/test` and Playwright Chromium are included in the dependencies and installed
- Use HTML <img> tags in PR descriptions, not markdown

### URL Format

https://github.com/username/repo/raw/branch-name/docs/screenshots/filename.png
