# Global CLAUDE.md

This file provides guidance to all Claude Code (claude.ai/code) instances when working on this machine.

## Updating Memory

- **ALWAYS** check the CLAUDE.md file in the root of the current project your working and update it with relevent changes based on recent work or discoveries
- **ALWAYS** keep docs concise and well formatted
- Remove stale or unnecessary notes, sections or memories

## Git Workflow

- When prompted, check the repo for any open issues
- When working on a new issue, read and understand the requirements and make a plan
- Once the plan is complete, create a new git branch
- Work the issue
- Once the work is complete, lint the code, track all changes, commit and push that branch
- Once the branch is pushed, create a new PR referencing the issue worked. If the branch is based off of another branch, make sure the PR's base branch is set to that branch and not `main`

### Key Points

- Work only one github issue at a time
- Each github issue should have it's own PR, reference and fix a single issue
- If there are multiple issues to be worked, work one at a time from the lowest issue number to the highest (oldest to newest)
- The PR should always include a phrase like "fixes #1" where #1 represents the issue number being worked. This will back-link the PR to the issue and make sure the issue closed automatically when the PR is merged
- The PR description should (at the top) include a link to the PR deployment on Railway
