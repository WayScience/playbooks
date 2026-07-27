# Habomero

Habomero is an image data management service built on [OMERO](https://www.openmicroscopy.org/omero/) — an open-source platform for viewing, organizing, and analyzing microscopy images — that helps labs manage those images alongside the metadata that describes them.
It reads its images from [Isilon](https://www.cuanschutz.edu/offices/office-of-information-technology/tools-services/storage-servers-and-backups), CU Anschutz's shared network storage, so getting connected to Isilon is a prerequisite for both contributing images to and analyzing images through habomero.

This playbook covers how habomero relates to Isilon, the roles involved, how to connect to Isilon, and the folder conventions we expect for uploaded data.
It is intentionally written without reference to specific datasets so it can be reused by other groups running a similar service.

## Key terms

If you are new to this stack, these are the terms used throughout this playbook:

- __[OMERO](https://www.openmicroscopy.org/omero/)__ — Open Microscopy Environment Remote Objects: an open-source platform for storing, viewing, organizing, and analyzing microscopy images together with their metadata. Habomero runs an OMERO server that people browse and analyze images through.
- __[Isilon](https://www.cuanschutz.edu/offices/office-of-information-technology/tools-services/storage-servers-and-backups)__ — CU Anschutz's shared, [network-attached storage](https://en.wikipedia.org/wiki/Network-attached_storage) (a Dell PowerScale system, formerly branded "Isilon"). Think of it as a large shared network drive where image data lives durably. The Way Lab's Isilon share is nicknamed `bandicoot`.
- __[Mounting](https://en.wikipedia.org/wiki/Mount_%28computing%29) / mount point__ — making a remote folder (such as an Isilon share) appear as an ordinary local folder on your computer. The local path where it appears (here, `~/mnt/<name>`) is the "mount point."
- __[SMB / CIFS](https://en.wikipedia.org/wiki/Server_Message_Block)__ — the network protocol used to connect to Isilon shares. `mount_smbfs` (macOS) and `cifs-utils` (Linux) are the tools that speak it.
- __[VPN (virtual private network)](https://www.ucdenver.edu/offices/office-of-information-technology/software/how-do-i-use/vpn-and-remote-access)__ — a secure connection into the campus network, required to reach Isilon when you are off campus.
- __Plate__ — in this context, a microscopy multi-well plate (and its images) that you upload as a unit of data.
- __Provenance__ — the record of where data came from and how it was processed, which we preserve for reproducibility.

## What is habomero?

[Habomero](https://github.com/WayScience/habomero) is a reproducible, server-style OMERO deployment (using [Docker Compose](https://docs.docker.com/compose/), [Ansible](https://docs.ansible.com/), and [`uv`](https://docs.astral.sh/uv/)) intended to run on a Linux workstation.
Once running, it imports images from directories that are mounted onto its host and serves them through OMERO for browsing, annotation, and analysis.
These deployment and automation tools are mainly the concern of [service maintainers](#roles); data / image providers and bioimage analysts do not need to interact with them directly.

Because habomero imports from mounted directories, __Isilon is used as the data source__: image providers place data on Isilon, the habomero host mounts the relevant Isilon directories, and OMERO ingests the images from there.
See the [habomero repository](https://github.com/WayScience/habomero) for setup and operational details (this playbook does not duplicate them).

## Service status

> ℹ️ Habomero is currently offered as a __best-effort service__.

"Best-effort" means availability, ingestion timing, and support are coordinated rather than guaranteed, and the service is expected to evolve over time.
In practice:

- Plan to __communicate with the service maintainers__ before relying on habomero for time-sensitive work.
- Expect that access, ingestion schedules, and uptime may change as the service matures.
- Treat Isilon (not habomero) as the durable home for your data; habomero is a view and analysis layer on top of it.

## Roles

Three roles interact with habomero.
A single person may hold more than one role.

| Role                       | Primary responsibilities                                                                                                                                            |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| __Data / image providers__ | Upload plates and images to Isilon under experiment-describing folders (see [conventions](#folder-and-naming-conventions)); keep provenance and metadata organized. |
| __Bioimage analysts__      | Access images through habomero (OMERO) or a direct Isilon mount to run analysis; coordinate with maintainers on what has been ingested.                             |
| __Service maintainers__    | Operate and maintain the habomero service; manage Isilon mounts, ingestion, allowlisted users, and backups; communicate availability and changes.                   |

## Isilon as the data source

Isilon is where image data durably lives, and habomero imports from it.
The typical flow is:

```mermaid
flowchart LR
    providers["Data / image<br>providers"] -->|upload to<br>experiment folders| isilon["Isilon<br>(Dell PowerScale)"]
    isilon -->|mounted &<br>imported| habomero["Habomero<br>(OMERO service)"]
    habomero -->|browse &<br>analyze| analysts["Bioimage<br>analysts"]
    maintainers["Service<br>maintainers"] -.->|operate &<br>maintain| habomero
    analysts -.->|direct mount<br>(optional)| isilon
```

**Figure 1.** Data / image providers upload images to Isilon under experiment-describing folders.
The habomero host mounts those Isilon directories and imports the images into OMERO, where bioimage analysts browse and analyze them.
Analysts may also mount Isilon directly when they need the underlying files.
Service maintainers operate the habomero service throughout.

For broader context on how Isilon (`bandicoot`) fits into labs' overall storage strategy, see [Data Strategy](data_strategy.md#using-isilon).

## Connecting to Isilon

Connecting to Isilon requires a computer on the campus network or the [CU Anschutz VPN](https://www.ucdenver.edu/offices/office-of-information-technology/software/how-do-i-use/vpn-and-remote-access).

> ℹ️ __Username note:__ authenticate with your __CU Anschutz enterprise username__ (not a local machine username).
> Connect to the VPN first if you are off the campus network.

There are two supported ways to connect.
Most people should use the OIT/SOM mapped-network-drive (GUI) approach; the command-line mount script is a backup for those who prefer the terminal or need to mount an arbitrary path.

### Option A — OIT / SOM mapped network drive (GUI)

For most people, the simplest way to connect is to map Isilon as a network drive following the SOM Knowledge Base guidance for Windows and macOS:

- [Map to SOM Network Drive](https://medschool.zendesk.com/hc/en-us/sections/360005463054-Map-to-SOM-Network-Drive)

Map to the DBMI base path (`\\data.ucdenver.pvt\dept\SOM\DBMI\...` on Windows, `smb://data.ucdenver.pvt/dept/SOM/DBMI/...` on macOS) while connected to the campus network or VPN.

### Option B — connection script (CLI, backup)

If you prefer the command line — or need to mount an arbitrary lab or experiment path — the [CU-DBMI `data-storage`](https://github.com/CU-DBMI/data-storage) repository provides a general-purpose `mount_isilon.sh` script that mounts an Isilon share to `~/mnt/<name>`.
It auto-detects macOS (`mount_smbfs`) vs. Linux (`cifs-utils` + `mount -t cifs ... domainauto`), checks network reachability, and prompts for your CU Anschutz username where needed.

We recommend downloading and reviewing the script before running it:

```shell
curl -fsSL https://raw.githubusercontent.com/CU-DBMI/data-storage/main/src/mount_isilon.sh -o /tmp/mount_isilon.sh
less /tmp/mount_isilon.sh
sh /tmp/mount_isilon.sh
```

Or run it directly if you prefer:

```shell
curl https://raw.githubusercontent.com/CU-DBMI/data-storage/main/src/mount_isilon.sh | sh
```

The script prompts for the share to mount and accepts three input styles, all resolved under the DBMI base path `//data.ucdenver.pvt/dept/SOM/DBMI/`:

- A simple name — `LabName`
- A relative path — `dbmi/Way_McKinsey_Cardiac_Fibrosis`
- A full SMB path — `smb://data.ucdenver.pvt/dept/SOM/DBMI/dbmi/Way_McKinsey_Cardiac_Fibrosis`

> ℹ️ The Way Lab also maintains a share-specific script, [`mount_bandicoot.sh`](internal/mount_bandicoot.sh), for its default `bandicoot` mount.
> Use `mount_isilon.sh` when you need to mount an arbitrary lab or experiment path (as is common for habomero data).

### Requesting access and help

- To request DBMI Isilon storage or access, or for connection issues, contact SOM IT at [dbmi@medschool.zendesk.com](mailto:dbmi@medschool.zendesk.com).
- For habomero-specific questions (what has been ingested, availability), contact the service maintainers.
- Storage [rates and billing](https://www.cuanschutz.edu/offices/office-of-information-technology/get-help/billing-and-rates) are published by CU Anschutz OIT.

## Folder and naming conventions

To keep uploads discoverable, reproducible, and easy for habomero to import, __every uploaded plate or dataset must live under a folder that describes the experiment__ rather than being uploaded as a loose, arbitrarily named plate at the top level.

We suggest a nested, experiment-scoped pattern:

```text
<Group_Project>/<Experiment>_data/<image_subset>/
```

For example, a pilot image set from a "SPLAT" experiment might live at:

```text
Way_McKinsey_Cardiac_Fibrosis/SPLAT_data/pilot_images/
```

This convention:

- Makes it clear which experiment any given plate belongs to, aiding provenance.
- Avoids collisions and confusion from "willy-nilly" uploads of random plate names.
- Maps cleanly onto the relative-path input accepted by `mount_isilon.sh` and onto habomero's per-directory import configuration.

> ⚠️ Agree on the top-level `<Group_Project>` folder name with the service maintainers before your first upload, so that mounts and ingestion configuration stay consistent over time.
