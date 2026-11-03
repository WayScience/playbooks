# Project Card

A project card is a one-page, standardized summary of a project's design and data.
It exists so anyone — a new lab member, a collaborator, a reviewer, or future-you — can learn the essentials of a project without digging through code, chat history, or someone's memory.

This is the same idea as a "model card" or "system card" used elsewhere in ML/AI, applied to a biomedical imaging project: the same sections appear every time, in the same order, so readers always know where to look.

## 1. When to create one

Create a project card when a project starts (even before any data exists — fill in what you know and update it as the project develops), for:

- Any new analysis or data repository (see [GitHub Strategy](github_strategy.md)).
- Any project involving patient/subject samples, a specific cell type, or microscopy imaging.

Skip it only for small, short-lived exploratory work that will not become its own repository.

## 2. How to use it

1. Copy the template at [`templates/project_card_template.md`](templates/project_card_template.md) into the root of the project repository as `PROJECT_CARD.md`.
1. Fill in every section. If a section does not apply, write "N/A" with a one-line reason rather than deleting it — this keeps the same sections present across every project, so readers can rely on their existence.
1. Link `PROJECT_CARD.md` from the project's `README.md`.
1. Keep it up to date: update the card (and its changelog section) whenever the design, data location, or status changes meaningfully, not just at project kickoff.

## 3. What's always included

Regardless of project specifics, every project card answers the same questions:

| Section             | Always answers                                                                                   |
| ------------------- | ------------------------------------------------------------------------------------------------ |
| Overview            | What is this project, who owns it, what is its status and data classification right now?         |
| Design              | What is the hypothesis, the disease studied, the experimental design, and the scale of the data? |
| Biological material | Who/what are the patients or subjects, what cell type(s), and what disease and treatments?       |
| Assay               | What stains, dyes, or antibodies mark what, on what channel?                                     |
| Imaging             | What microscope, image format, bit depth, and dimensions produced the images?                    |
| Data                | Where do the raw and processed data live, and who/what can access them?                          |
| Contacts            | Who is the PI, project lead, and who else is involved?                                           |
| Changelog           | What has materially changed about the project, and when?                                         |

See the [template](templates/project_card_template.md) for the full field-by-field layout, including examples (e.g. Cell Painting channel naming) for the assay and imaging sections.

For projects that model a disease or apply treatments (drugs, biologics, gene therapies), the biological material section also records the disease/condition — stage and how it was confirmed — and each treatment's target, dose, route, and schedule. Projects with no disease model, or whose "treatments" are screening perturbations already enumerated in the design section and platemap, write "N/A" with that reason instead of duplicating the library.

### Data classification

Every card records a data classification: **open**, **confidential**, **highly confidential**, or **HIPAA**. This answers the question raised in [issue #5](https://github.com/WayScience/playbooks/issues/5) — "is the data open, confidential, highly confidential, HIPAA?" — explicitly and up front, rather than leaving it implicit or discovered only once something goes wrong.

Because project cards live in project repositories (which are frequently public, per [GitHub Strategy](github_strategy.md)), the classification is not just descriptive — it constrains what the card itself is allowed to say: anything other than "open" means the card must reference where restricted details (patient identifiers, raw clinical metadata, etc.) live rather than reproducing them inline. See the template's own note in section 1 for the specific rule.

## 4. Why a fixed template

A fixed set of sections (rather than free-form notes) means:

- Readers never have to search for where a particular fact lives — it's always in the same section.
- Missing information is obvious (an empty table cell or an unexplained "N/A"), rather than silently absent from a prose summary.
- Cards are comparable across projects, which matters once the lab runs more than a handful of them at once.
