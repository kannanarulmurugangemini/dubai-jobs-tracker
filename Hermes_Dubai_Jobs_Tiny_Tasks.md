# Hermes Agent Playbook: Dubai/UAE IT Jobs, Tiny Subtasks

**How to use:** The user will say, for example, "Read /opt/data/Hermes_Dubai_Jobs_Tiny_Tasks.md and do only subtask A3." Do exactly that one subtask, then STOP.

---

## 0. Rules that always apply

1. **One subtask per message.** Do not start the next subtask. After finishing, reply in 8 lines or fewer: what you did, what you saved (exact path), and what the next subtask is.
2. **Output folder:** `OUT = /opt/data/DubaiJobs`. Create it if missing. Never write outside `/opt/data`.
3. **Today's date:** run `date +%F` in the terminal. Never guess the date.
4. **Safety:** never log in, register, apply, submit any form, or enter personal information. Never bypass CAPTCHA, bot protection, or login walls. If blocked, mark `BLOCKED` and move on.
5. **Retry once, then skip.** Record the reason.
6. **Polite browsing:** wait 3 to 5 seconds after each page load or filter change, and wait for results to finish loading before reading them.
7. **Keep context small:** never print a whole page. Read only the page title, the specific elements you need, or the first 1500 characters of visible text.
8. **No delegation or subagents.** Use one browser, one page at a time.
9. **Never invent** jobs, URLs, dates, screenshots, file paths, or memory updates. Use `Not stated` or `Unknown` when information is missing. Only mention a screenshot if you saved it and confirmed with `ls`. Screenshots are optional.
10. **Verify every write:** after saving a file, run `ls -l` on it. Only then say it was saved.
11. **Update `OUT/PROGRESS.md`** at the end of every subtask (one line: date, subtask ID, result).
12. **Ask first** before doing anything not listed in the current subtask.
13. **Do not store** passwords, cookies, tokens, or personal data anywhere, including memory.

## 1. Profile (the user may edit this)

- Fields: IT Support/Helpdesk, IT Infrastructure/SysAdmin, Software/IT Developer, Cloud, DevOps/SRE, AI Engineer/AI Automation/AI Agents.
- Experience target: 3 to 5 years (provisional, not confirmed).
- Location: Dubai first; other UAE locations in a separate section.
- Employers: Dubai government, UAE government, government-owned companies, then private.
- Expatriate eligibility: record `YES`, `NO`, or `UNKNOWN`, with a short evidence phrase (under 15 words). Never assume government jobs accept expatriates.

## 2. Files you will use (all inside OUT)

| File | Purpose |
|---|---|
| `PROGRESS.md` | One line per finished subtask |
| `WEBSITES.md` | Table of candidate sites and test results |
| `CANDIDATES.md` | Table of vacancies found, not yet verified |
| `VERIFIED.md` | Verified vacancy details, one section per job |
| `reports/Dubai_IT_Jobs_YYYY-MM-DD.md` | Final dated report (never overwrite an old one) |

---

# PHASE A: Websites

### A1. Setup (no browsing)
1. Create `OUT`, `OUT/reports`, and the files in the table above if they do not exist.
2. Give each file a title line. Give `WEBSITES.md` and `CANDIDATES.md` their table headers (see column lists in A2 and B1).
3. Verify with `ls -l`.
**Done when:** all five items exist. Stop.

### A2. Make the candidate website list (no testing)
1. Use web search to find 8 to 12 relevant job websites. Start with `dubaicareers.ae`, then Dubai government entity career pages, then UAE federal and other emirate portals, then government-owned employers, then 2 or 3 general portals.
2. Only use URLs that actually appeared in search results.
3. Add one row per site to `WEBSITES.md` with status `UNTESTED`.
   Columns: `Name | Homepage URL | Job search URL | Category | Status | Test date | Steps that worked | Limitations`
**Done when:** the list is saved. Do not open the sites yet. Stop.

### A3. Test ONE site
1. Take the first row in `WEBSITES.md` whose status is `UNTESTED`.
2. Open it with Puppeteer. Wait, then read the page title and the first 1500 characters of visible text.
3. Look for the job search page. If it is reachable without signing in, open it, apply one filter, then open one listing.
4. Set the status:
   - `WORKING`: site, search, and a listing all opened.
   - `PARTIAL`: site opens but search, filters, or details do not work.
   - `BLOCKED`: access denied, CAPTCHA, bot protection, or login required.
   - `FAILED`: unavailable after one retry.
5. Update that row: status, today's date, the exact steps that worked, and any limitation.
**Done when:** exactly one row is updated. Stop. (The user will say "run A3 again" for the next site.)

### A4. Summarize the audit (no browsing)
1. Count sites in each status and write the counts at the top of `WEBSITES.md`.
2. Add a "Search first" line naming the best 3 sites and why (based only on test results).
**Done when:** saved. Stop.

### A5. Save website knowledge to memory
1. Use the Hermes memory tool, if it is available, to save at most 10 short lines: working site names, verified search URLs, filter steps that worked, known limitations, last-verified date, and the path `OUT/WEBSITES.md`.
2. Update existing notes instead of adding duplicates.
3. If no memory tool exists, say so plainly. Do not pretend a normal file is Hermes memory.
**Done when:** you confirmed the save or reported that it failed. Stop.

---

# PHASE B: Find candidate vacancies

### B1. Search ONE site for ONE job family
1. Pick the next `WORKING` site (Dubai government sites first) and the next job family from section 1 that has not been searched. Check `PROGRESS.md` to avoid repeats.
2. Use the verified steps from `WEBSITES.md`. Search Dubai first.
3. Collect up to 5 matching vacancies. For each, record only what the results page shows.
4. Append to `CANDIDATES.md`, skipping duplicates by URL.
   Columns: `Title | Employer | Location | Closing date | URL | Source site | Job family | Verified?` (set `No`)
**Done when:** rows are appended. Stop. (The user will say "run B1 again" for the next site or family.)

### B2. Other UAE locations (optional, same as B1)
Same as B1, but record non-Dubai locations under a separate heading in `CANDIDATES.md`.

---

# PHASE C: Verify

### C1. Verify ONE vacancy
1. Take the first row in `CANDIDATES.md` where `Verified?` is `No`.
2. Open its original URL. Wait for it to load.
3. Read only the job details. Record these fields (use `Not stated` when missing):
   - Title, employer, employer category (government, government-owned, or private)
   - Location, posted date, closing date
   - Experience required, education or certifications
   - Key technical skills
   - Expatriate eligibility: `YES`, `NO`, or `UNKNOWN`, with a short evidence phrase
   - Status: `active`, `expired`, `unclear`, or `inaccessible`
   - URL and date verified
4. Append one section to `VERIFIED.md`. Change that row's `Verified?` to `Yes`.
**Done when:** exactly one vacancy is verified. Stop.

### C2. Rank the best 3 (no browsing)
1. Using only `VERIFIED.md`, pick the 3 strongest matches. Rank by: relevance to the fields, fit with 3 to 5 years, Dubai/UAE location, explicit expatriate eligibility `YES`, and still active.
2. Write the ranking, with one sentence of reasoning each, at the top of `VERIFIED.md`.
**Done when:** saved. Stop.

---

# PHASE D: Report

### D1. Write the dated report
1. Run `date +%F`. Create `OUT/reports/Dubai_IT_Jobs_<date>.md`. If it already exists, add `_2` to the name instead of overwriting.
2. Use this layout, filled only from `WEBSITES.md` and `VERIFIED.md`:
   - Front matter: `title`, `date`, `type: job-search-report`, `tags: [DubaiJobs, UAEJobs, ITJobs]`
   - Summary: sites searched, vacancies found, verified active, eligibility unknown, pages skipped
   - Best 3 matches (with reasons)
   - Table of all verified vacancies (title, employer, location, closing date, expatriate eligibility, link)
   - Skipped or inaccessible pages and reasons
3. Verify with `ls -l`.
**Done when:** the file exists. Stop.

### D2. Update memory and progress
1. Save at most 5 lines to Hermes memory: report path, date, sites searched, and what remains to be done.
2. Confirm the update succeeded (or report that it failed).
**Done when:** confirmed. Stop.

### D3. Final answer to the user
Reply in 10 lines or fewer: how many vacancies were verified active, the top 3 and why, how many have unknown eligibility, skipped pages and reasons, and the exact report path.
