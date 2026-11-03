---
name: project-card
description: Use when filling out or refreshing a project's PROJECT_CARD.md. Know where to find design, patient, cell type, stain, and imaging facts.
version: 0.1.0
author: Dave Bunten (d33bs), Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [project-card, documentation, metadata, high-content-imaging]
    related_skills: []
---

# Project Card

Fill out or refresh a project's `PROJECT_CARD.md` (copied from
`templates/project_card_template.md` in this repo; see `project_card.md`
here for the full field reference) by gathering real facts from the target
project's repo and data, not by guessing or leaving placeholders.

## When to Use

- A new project repo needs its first `PROJECT_CARD.md`.
- An existing `PROJECT_CARD.md` is stale (data moved, design changed, new
  collaborators) and needs a refresh plus a changelog entry.
- Someone asks to "fill out the project card" or "write a project card"
  for a project.

## Procedure

1. Copy `templates/project_card_template.md` from this playbooks repo into
   the target project's root as `PROJECT_CARD.md` if it doesn't already
   exist. If it exists, read it first — never blind-overwrite an existing
   card; merge new findings into the existing structure.
1. Determine data classification (section 1 of the card) early, before
   filling anything else in — it governs whether later fields may be
   written inline or must be references only (see Pitfalls).
1. Work section by section. For each field, search the target repo and its
   linked data location before asking the user — the evidence usually
   already exists in one of the sources in the table below. Only ask the
   user for a field once you've actually looked and it's genuinely missing
   (e.g. an IRB approval number not recorded in any repo file).
1. Record the source for each non-obvious fact as an inline markdown
   comment next to the field (e.g. `<!-- from configs/plate_map.csv -->`)
   so a future reader can verify it without re-deriving it.
1. Never leave a field blank without an explanation — write
   "N/A — \<reason>" per the template's own instruction instead of
   deleting the row or section.
1. After filling in every section, append a Changelog row recording what
   was filled in or updated and the date.
1. Run the target repo's own markdown gate before handing back changes —
   check its `.pre-commit-config.yaml` first; don't assume it matches this
   playbooks repo's gate (mdformat-gfm + mdformat-frontmatter + codespell).
1. Report which sections you filled from evidence, which you left as
   "N/A", and which still need the user's input — don't claim the card is
   complete if any field is a guess.

## Where to look for each field

| Project card field                                                           | Look here first                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Data classification (open / confidential / highly confidential / HIPAA)      | any data use agreement (DUA) or data transfer agreement with the collaborator, the IRB protocol, repo visibility (public vs. private) and its license file, and — when none of those exist yet — ask the PI/project lead directly; never infer it from the data alone                                                                                                                                                                                                                                                                                      |
| Design (hypothesis, arms, perturbations, controls, replicates, plate layout) | README, `configs/`/`metadata/` plate maps or platemap CSVs, an analysis repo's `0.download-data`-style first module, any `plan.md`/design doc, the GitHub issue/PR that kicked off the project                                                                                                                                                                                                                                                                                                                                                             |
| Plating/seeding conditions (density, coating, fixation variant)              | the platemap CSV itself — real plate maps commonly carry `cell_line,row,column,well,seeding_density,condition` columns; the README section describing plate layout usually narrates what `condition` values mean (e.g. "Standard", "Synthemax coated", "double PFA fixation")                                                                                                                                                                                                                                                                              |
| Control cell line(s)                                                         | the platemap/well metadata (a line repeated across every plate, e.g. U2-OS, is usually the control) and the README's data/plate-map narration                                                                                                                                                                                                                                                                                                                                                                                                              |
| Patients / subjects                                                          | clinical/sample metadata file (columns like `patient_id`, `subject_id`, `age`, `sex`, `diagnosis`) — note this is **often a `.docx` or `.xlsx` under `metadata/`, not a CSV**, so read it directly rather than assuming plaintext; IRB protocol documents; README "Data"/"Plate map details" section which often narrates per-patient diagnosis/subtype and sex in prose even when the structured file doesn't                                                                                                                                             |
| Cell types                                                                   | sample/plate metadata columns (`cell_line`, `cell_type`), assay protocol doc, CellProfiler pipeline naming conventions, the repo name itself (projects are often named after the cell line or disease)                                                                                                                                                                                                                                                                                                                                                     |
| Stains / channels                                                            | CellProfiler `.cppipe` pipeline (channel names in `LoadData`/`NamesAndTypes` modules), the README's channel table, and the image filename/metadata convention actually used for the channel code — seen in practice as `d0`-`d4` filename suffixes, wavelength codes (`405`/`488`/`555`/`640`) in filenames, or a numbered TIFF acquisition order paired with a channel name in an instrument XML sidecar (e.g. Opera Phenix); illumination-correction file names are another cross-check                                                                  |
| Image formats (file type, bit depth, dimensions)                             | check the README first — instrument specs are often stated directly there (e.g. "Objective: 60x/1.35 NA oil immersion", "Bit depth: 16-bit", "Dimensions: (Z, Y, X)"); if absent, open an actual representative image file's header/metadata rather than inferring from the pipeline — use `file <path>`, `python -c "from PIL import Image; ..."`, or `tifffile`/Bio-Formats info. Projects pulling data from more than one collaborator or instrument (e.g. CQ1 vs. Opera Phenix) can have more than one answer here — record each instrument separately |
| Data location & access                                                       | repo README / data strategy references, `.dvc`/`.gitattributes` for LFS, known storage patterns from this lab's [Data Strategy](../../../data_strategy.md) (S3 buckets, Isilon paths, Alpine scratch/project dirs)                                                                                                                                                                                                                                                                                                                                         |
| Contacts & provenance                                                        | repo `CONTRIBUTING.md`/CODEOWNERS, `git shortlog -sn`, README acknowledgments                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

These patterns were confirmed against real WayScience project repos (e.g.
`pediatric_cancer_atlas_profiling`, `predicting_cardiac_fibrosis_etiologies`,
`nf1_schwann_cell_painting_data`, `NF1_3D_organoid_profiling_pipeline`) —
when in doubt, check how a similar published project in the org described
the same field rather than inventing a new shape for it.

## Pitfalls

- Treat data classification as a gate, not just a field: once it's anything
  other than "open" and the repo is (or may become) public, do not write
  actual patient identifiers, dates of birth, or other direct identifiers
  into `PROJECT_CARD.md` — write the location of the restricted metadata
  file instead and leave the identifiers there. Get this backwards and the
  card itself becomes the leak.
- Don't infer image format, bit depth, or dimensions purely from code
  comments or a pipeline file — these drift from reality; check an actual
  image file when one is reachable, or the README's stated instrument specs.
- Don't assume one microscope/format per project — pipelines are sometimes
  built specifically to handle more than one acquisition format across
  collaborators or data waves; list each instrument if more than one is used.
- Don't assume patient-level metadata is a CSV — it is just as often a
  `.docx` or `.xlsx` file, or only narrated in README prose; read whichever
  form actually exists rather than searching only for structured files.
- If a project has multiple independent data waves/batches (different cell
  lines, different timing, different platemap layouts), don't collapse them
  into one answer per field — call out each wave distinctly, the same way
  the source project's own README does.
- Don't fabricate patient counts, IRB numbers, or demographics — if the
  repo and reachable data don't state it, leave the field as
  "N/A — not found in repo/data; ask \<role>" and flag it in your report.
- Don't guess data classification either — if no DUA/IRB/visibility signal
  settles it, ask the PI/project lead rather than defaulting to "open".
- A stale card is worse than a missing one only if nobody notices it's
  stale — always add the Changelog row so readers can see when a field
  was last verified.
- Match the target repo's own markdown formatting gate before finishing;
  don't assume it's the same as this playbooks repo's.

## Verification

- Every filled field traces to a cited source (file path, command output,
  or explicit "user-provided") — nothing is a guess.
- Every section of the template is present in the output card, with
  "N/A — reason" for inapplicable ones, never a deleted section.
- Data classification is set, and if it's not "open", no direct patient
  identifiers appear anywhere else in the card.
- The target repo's own lint/pre-commit passes on the new/edited
  `PROJECT_CARD.md`.
- The Changelog has a new row dated today describing what changed.
