# Browser Testing & Automation

Use Playwright MCP to test: $ARGUMENTS

## Available Actions
- Navigate to URLs
- Click elements (by role/text/selector)
- Fill forms
- Take screenshots
- Check console logs
- Verify page content

## Usage Tips
1. Say "use playwright mcp" explicitly first time
2. Use accessibility selectors (role, text) over CSS
3. Check console for errors after actions

## Example Tasks
- "Open localhost:3000, log in as testuser, verify dashboard"
- "Navigate to /settings, change theme, screenshot result"
- "Fill registration form, submit, check for errors"

## When NOT to Use
- Simple HTTP fetching (use WebFetch or Jina instead)
- Static content scraping (use Firecrawl)
- Heavy scraping (use dedicated scraper)

Playwright is best for interactive testing and verification.
