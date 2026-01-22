# BioImage Archive Upload

This is a short, practical guide to uploading datasets to the BioImage Archive.

## What is BioImage Archive?

BioImage Archive is a public repository for biological imaging data.
It hosts raw image datasets with stable accession IDs so others can find, access, and reuse the data tied to a publication or project.

## When to use this

Use this guide when a project is ready to publish raw image data and the authoring team has decided to deposit in the BioImage Archive.

## Prerequisites

- A finalized dataset folder (no in-progress changes).
- A metadata sheet with sample, imaging, and experimental details (or manuscript with these details)

## Quick steps

1. Organize files into a single local submission folder. If the files are stored on a network share, consider copying them locally to ensure the transfer to BioImage Archive is seamless.

1. Login or create account on the [BioImage Archive login page](https://www.ebi.ac.uk/biostudies/submissions/signin) (accounts are free to create).

1. Upload files using ["files" tab](https://www.ebi.ac.uk/biostudies/submissions/files) (bulk uploads require Aspera or FTP). The bulk connection information unique to your account is available under the "FTP/Aspera" button. Note: you can use [`rclone`](https://rclone.org/ftp/) here to help manage the FTP connection transfers from the command line.

1. Fill out a new submission from the ["submissions" tab](https://www.ebi.ac.uk/biostudies/submissions/). Note: you can copy and paste fields into a Google Doc (or another service) for verification with your authoring team.

1. Generate "study component" for uploaded files with (one for each type of file).

You'll need to generate a `.tsv` file like this for the field:

```tsv
Files   File Type   File Size
filename.tif    image/tiff  7225258
...
```

6. Submit for review and record the accession ID.

## After submission

1. Watch the ["submissions" tab](https://www.ebi.ac.uk/biostudies/submissions/) for challenges with your upload (it will show an icon indicating there's an issue which needs to be resolved if something comes up).

1. If you run into trouble or questions, reach out to bioimage-archive@ebi.ac.uk to help address issues.

1. Once the submission is successful you'll have access to a link which [looks like this](https://www.ebi.ac.uk/biostudies/studies/S-BIAD2515) from the "submissions" tab.
