# Lexi - Legal & Compliance Advisor (Claude Code agent)

Lexi is a self-hostable **legal & regulatory compliance advisor** for Claude Code, built for Israeli small businesses and marketing agencies (with EU/US GDPR/CCPA coverage for international campaigns). She explains the law in plain Hebrew, flags risk, and prepares drafts (privacy policy, תקנון, contract clauses, response letters).

> [!WARNING]
> **Lexi is not a lawyer and is not a substitute for one.** She provides informational compliance support only. Every substantive output ends with a boundary line: what is safe to act on now, and what needs a licensed lawyer's (עו"ד) sign-off. Do not rely on her output for binding contracts, litigation, or regulator inquiries.

## What she covers
- **Contracts & agreements** - retainers, NDAs, vendor agreements (MSA/DPA/SOW), terms of service, dangerous clauses.
- **Privacy & data** - תיקון 13 (Amendment 13), privacy policy, database duties, consent, DSRs; GDPR/CCPA abroad.
- **Advertising & consumer** - חוק הגנת הצרכן, spam law (סעיף 30א / תיקון 40), targeting consent.
- **Tax & finance** - מע"מ, עוסק מורשה/פטור, deductible expenses, lawful price quotes.
- **Employment** - employment contracts, Section 14, notice, non-compete, pension/severance.
- **Disputes** - small claims, consumer disputes, demand letters.

## How it's built
```
lexi-legal-agent/
├── agents/lexi.md          # the agent (Claude Code sub-agent)
├── knowledge/              # entry point + regulatory map + learned memory
│   ├── index.md
│   ├── regulatory-map.md   # Lexi's entry point: which law applies + which skill covers it
│   └── memory.md           # persistent learning (starts empty)
├── skills/israeli-*/       # 8 bundled compliance skills (MIT, by Skills IL / YooTech)
└── install.sh              # merge-not-clobber installer
```

Lexi depends on three groups of skills:
| Group | Skills | Shipped here? |
|-------|--------|---------------|
| Israeli compliance | `israeli-privacy-shield`, `israeli-paid-ads`, `israeli-ecommerce-compliance`, `israeli-expense-categorizer`, `israeli-price-quote-generator`, `israeli-small-claims-court`, `israeli-employment-contracts`, `israeli-employment-contract-reviewer` | ✅ bundled (MIT) |
| Contracts / risk | `legal:*` (review-contract, triage-nda, vendor-check, risk-assessment, compliance-check, response, brief, signature-request) | ↗ install from `anthropics/knowledge-work-plugins` |
| Documents | `pdf`, `docx` | ↗ install from `anthropics/anthropic-agent-skills` |

## Install
```bash
git clone https://github.com/lieox/lexi-legal-agent.git
cd lexi-legal-agent
./install.sh
```
The installer copies the agent, the knowledge base, and the 8 bundled skills into `~/.claude/` (existing files are backed up, your `memory.md` is preserved). It then prints the one-time marketplace commands for the referenced Anthropic skills. Restart Claude Code and call the `lexi` agent.

### Optional: a business profile
Lexi reads a `BUSINESS.md` (owner/business profile) from your working directory if present - name, what the business does, clients, exposure. This makes her advice and drafts specific to you. Without it she'll ask for the essentials. `BUSINESS.md` is git-ignored so your details never get committed.

## Customize
- **Rename her:** change `name:` in `agents/lexi.md` and the knowledge path references.
- **Extend her knowledge:** drop notes into `knowledge/` and link them from `index.md`. She reads the map first, then the relevant file.
- **She learns:** durable lessons get appended to `knowledge/memory.md` over time.

## License & credits
- Lexi agent + knowledge base: **MIT**, © LvlUp (see `LICENSE`).
- Bundled `israeli-*` skills: **third-party**, © [Skills IL](https://github.com/skills-il) (YooTech), MIT, bundled unmodified. LvlUp claims no authorship.
- `legal:*`, `pdf`, `docx`: Anthropic's, referenced not redistributed.

Full attribution in [`CREDITS.md`](CREDITS.md).

---

## עברית

Lexi הוא **יועץ ציות ורגולציה** לסביבת Claude Code, בנוי לעסקים קטנים וסוכנויות שיווק בישראל (עם כיסוי GDPR/CCPA לקמפיינים בחו"ל). היא מסבירה את החוק בעברית פשוטה, מסמנת סיכון, ומכינה טיוטות (מדיניות פרטיות, תקנון, סעיפי חוזה, מכתבי תגובה).

> [!WARNING]
> **Lexi אינה עורכת דין ואינה תחליף לעו"ד.** היא נותנת תמיכת ציות מידעית בלבד. כל פלט מהותי מסתיים בשורת גבול: מה בטוח לפעול עליו עכשיו, ומה דורש אישור עו"ד. אל תסתמכו על הפלט לחוזים מחייבים, התדיינות משפטית, או פניות רגולטור.

**תחומים:** חוזים והסכמים · פרטיות ודאטה (תיקון 13) · פרסום והגנת הצרכן · מיסוי וכספים · דיני עבודה · תביעות קטנות.

**התקנה:** `git clone` ואז `./install.sh`. הסקריפט מעתיק את הסוכן, בסיס-הידע ו-8 הסקילים ל-`~/.claude/` (עם גיבוי לקבצים קיימים, ושמירת ה-`memory.md` שלך), ומדפיס את פקודות ההתקנה של הסקילים הרשמיים של Anthropic. הפעילו מחדש את Claude Code וקִראו לסוכן `lexi`.

**רישיון:** MIT, זכויות היוצרים של LvlUp (על הסוכן ובסיס-הידע בלבד). הסקילים `israeli-*` הם צד-שלישי מפרויקט Skills IL (YooTech), MIT, מצורפים ללא שינוי, LvlUp אינה טוענת לבעלות. הסקילים `legal:*`/`pdf`/`docx` הם של Anthropic, מופנים ולא מופצים מחדש.
