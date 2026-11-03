<!--
PROJECT CARD TEMPLATE
Copy this file into the root of a project repository as PROJECT_CARD.md and fill it in.
See ../project_card.md for guidance on what belongs in each section.
Keep every section; write "N/A" with a one-line reason rather than deleting a section that doesn't apply.
-->

# \<Project Name> — Project Card

> One-paragraph summary: what question this project answers, what data it uses, and its current status.

## 1. Overview

| Field                | Value                                             |
| -------------------- | ------------------------------------------------- |
| Project name         |                                                   |
| Status               | planning / pilot / full-run / complete / archived |
| Data classification  | open / confidential / highly confidential / HIPAA |
| Owner(s)             |                                                   |
| Related repositories |                                                   |
| Related publications |                                                   |
| Last updated         | YYYY-MM-DD                                        |

Data classification governs what this card itself may say. If classification is anything other than "open" and this repository is (or may become) public, do not write actual patient identifiers, dates of birth, or other direct identifiers into this file — reference the restricted metadata file's location instead (see 3.1) and keep the identifiers only in the access-controlled location.

## 2. Design

- Hypothesis / question:
- Disease / condition studied:
- Experimental design (arms, perturbations/treatments, replicates):
- Positive/negative controls (e.g. DMSO/vehicle, a known-reference compound, a control cell line present across plates):
- Plating/seeding conditions, if varied (seeding density, coating, fixation variant):
- Plate / batch layout (or link to platemap file(s)):
- Timepoints:
- Sample size (e.g. number of plates, wells, patients, cell lines):
- Data waves/batches: if data were collected in more than one independent wave/round (e.g. a pilot wave followed by a production wave, or waves with different cell lines), note each wave here and give it its own row/note in the sections below rather than silently merging them.

## 3. Biological material

### 3.1 Patients / subjects

| Field                             | Value |
| --------------------------------- | ----- |
| Patient/subject count             |       |
| Source / cohort                   |       |
| Demographics (age, sex)           |       |
| Diagnosis / disease subtype       |       |
| IRB / ethics approval             |       |
| De-identification / consent notes |       |
| Patient metadata file (location)  |       |

Patient-level detail (one row per patient, including diagnosis/subtype and which wells/plates they map to) often lives in a separate metadata file (CSV, XLSX, or DOCX) rather than inline in a README — record its path above rather than duplicating the full table here.
If the project has no human subjects, write "N/A — no patient samples" here rather than deleting the section.

### 3.2 Cell types

| Field                                                              | Value |
| ------------------------------------------------------------------ | ----- |
| Cell type(s) / line(s)                                             |       |
| Tissue of origin                                                   |       |
| Primary vs. immortalized                                           |       |
| Genetic background / perturbation (e.g. CRISPR, isogenic)          |       |
| Control cell line(s) (e.g. a reference line imaged on every plate) |       |

### 3.3 Disease and treatments

Section 2 records how treatments map to arms and groups; this section records what the disease and each treatment actually are (one row per disease / per treatment when there are several). Patient-level diagnoses stay in the patient metadata file (see 3.1), not here. If the project has no disease model (e.g. a reference or methodological study), write "N/A — no disease model" rather than deleting the section; if the "treatments" are screening perturbations (compounds, CRISPR, RNAi) already enumerated in section 2 and the platemap, write "N/A — perturbations in section 2 / platemap" rather than duplicating the library. When the data classification is not "open", keep re-identifying disease detail (rare conditions, donor genotypes) out of this file and reference the restricted metadata file instead.

#### Disease / condition

| Field                              | Value |
| ---------------------------------- | ----- |
| Disease / condition                |       |
| Model system / relevance notes     |       |
| Stage / severity                   |       |
| Diagnosis / pathology confirmation |       |
| Source (reference or metadata)     |       |

#### Treatments

| Field                         | Value |
| ----------------------------- | ----- |
| Treatment / intervention      |       |
| Target / mechanism of action  |       |
| Dose / concentration          |       |
| Route / delivery              |       |
| Schedule / duration           |       |
| Group / arm assignment        |       |
| Source / vendor (catalog no.) |       |

Example: disease = Parkinson's disease, model = human iPSC-derived dopaminergic neurons from a donor carrying an LRRK2-G2019S mutation, confirmation = genotype report; treatment = LRRK2-IN-1, dose = 10 µM, route = culture media, schedule = 48 h before imaging, group = treatment arm (see `platemap.csv`).

## 4. Assay

### 4.1 Stains / channels

| Channel name | Stain / dye / antibody | Target | Channel code (image filename suffix or instrument channel ID) |
| ------------ | ---------------------- | ------ | ------------------------------------------------------------- |
|              |                        |        |                                                               |

Example (Cell Painting): DNA = Hoechst 33342 (target: nucleus), ER = concanavalin A/Alexa 488, RNA/nucleoli = SYTO 14, AGP = phalloidin + WGA, Mito = MitoTracker Deep Red.
The "channel code" column matters as much as the stain name — real pipelines key off of it (e.g. `d0`-`d4` filename suffixes, wavelength codes like `405`/`488`/`555`/`640` in filenames, or a numbered TIFF order paired with a channel name in an instrument XML sidecar).

- Assay protocol reference (link or doc):
- Fixation method:

## 5. Imaging

| Field                                                       | Value |
| ----------------------------------------------------------- | ----- |
| Microscope / instrument(s)                                  |       |
| Objective / magnification (e.g. `20x`, `60x/1.35 NA oil`)   |       |
| Image format (e.g. `.tiff`, `.czi`, `.nd2`)                 |       |
| Bit depth (e.g. `16-bit`)                                   |       |
| Image dimensions (e.g. `(Z, Y, X)` or pixel width x height) |       |
| Channels per site                                           |       |
| Sites / fields of view (FOVs) per well                      |       |
| Z-planes                                                    |       |

If more than one microscope or acquisition format was used (e.g. different instruments per collaborator, or per data wave), list each one as its own row or sub-table rather than picking just one.

## 6. Data

| Field                            | Value |
| -------------------------------- | ----- |
| Raw data location                |       |
| Processed data location          |       |
| Data access / restrictions       |       |
| Data use agreement / DUA on file |       |
| Approx. size                     |       |
| Pipeline / processing repo(s)    |       |

"Data access / restrictions" should be consistent with the "Data classification" field in section 1 (e.g. who may access it, whether a data use agreement or IRB protocol governs it, and any embargo before public release).

## 7. Contacts & provenance

| Role                   | Name |
| ---------------------- | ---- |
| PI                     |      |
| Project lead           |      |
| Data analyst(s)        |      |
| External collaborators |      |

## 8. Changelog

| Date | Change | By  |
| ---- | ------ | --- |
|      |        |     |
