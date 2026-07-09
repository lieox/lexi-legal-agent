# Credits & Third-Party Notices

Lexi is assembled from parts with different authorship. This file records who owns what so redistribution is clean.

## 1. Lexi agent + knowledge base  (© LvlUp)
- `agents/lexi.md` and everything under `knowledge/` were authored by **LvlUp** for this repo.
- Licensed **MIT** (see `LICENSE`). Copyright (c) 2026 LvlUp.

## 2. Bundled skills (`skills/israeli-*`)  -  THIRD PARTY, © Skills IL
The eight `israeli-*` compliance skills are **third-party** skills from the open-source **Skills IL** project, maintained by **YooTech** (https://yootech.io · alex@yootech.io). They are licensed **MIT** (each source repo ships a real `LICENSE` file, and every skill declares `license: MIT` in its `SKILL.md` frontmatter). LvlUp did **not** write them and claims **no** authorship or ownership - they are redistributed here **unmodified** under their own MIT license.

- **Source org:** https://github.com/skills-il
- **License:** MIT (with LICENSE files in each category repo)

Bundled skills and their source repository:

| Skill | Source repo |
|-------|-------------|
| israeli-privacy-shield | https://github.com/skills-il/security-compliance |
| israeli-ecommerce-compliance | https://github.com/skills-il/security-compliance |
| israeli-paid-ads | https://github.com/skills-il/marketing-growth |
| israeli-expense-categorizer | https://github.com/skills-il/accounting |
| israeli-price-quote-generator | https://github.com/skills-il/tax-and-finance |
| israeli-small-claims-court | https://github.com/skills-il/legal-tech |
| israeli-employment-contracts | https://github.com/skills-il/legal-tech |
| israeli-employment-contract-reviewer | https://github.com/skills-il/legal-tech |

MIT permission notice for the bundled skills:
```
Copyright (c) Skills IL / YooTech

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions: the above copyright
notice and this permission notice shall be included in all copies or
substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS",
WITHOUT WARRANTY OF ANY KIND.
```

> To always pull the latest versions, install these skills directly from Skills IL instead of the bundled copies (e.g. `claude install github:skills-il/security-compliance/israeli-privacy-shield`).

## 3. Referenced (NOT bundled) - install separately  -  Anthropic
These are Anthropic's official skills/plugins. Lexi calls them but this repo does **not** redistribute them; `install.sh` points you to the official marketplaces.
- `legal:*` (review-contract, triage-nda, vendor-check, legal-risk-assessment, compliance-check, legal-response, brief, signature-request) - from **anthropics/knowledge-work-plugins** (the `legal` plugin).
- `pdf`, `docx` - from **anthropics/anthropic-agent-skills**.

## Disclaimer
Lexi provides informational compliance support, not legal advice, and is not a substitute for a licensed lawyer. See `README.md`.
