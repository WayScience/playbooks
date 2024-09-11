A suitable and flexible data management plan is essential for effective and trustworthy science. Our goals with this strategy is to maximize access, understanding, analysis speed, and provenance while reducing access barriers, unnecessary storage bloat, and cost. 

## 1. Data perspectives

We think of data from three different perspectives:

1. Level

2. Origin

3. Flow

Each perspective requires different considerations for storage, access, and provenance management. Management practices for microscopy images are related to other data types, with some nuance.


### Level

Your data level indicates the processing stage. For example, the lowest data level, or “raw” data, are the images acquired by the microscope. Technically, the biological substrate is the “rawest” data, but we consider the digitization of biological data to be the lowest level.

With biological data, there are many different kinds of intermediate data. Intermediate data are typically different sizes and thus have different storage requirements. Each intermediate data type requires unique considerations for access frequency, dissemination, and versioning.


### Origin

Where your data come from also requires unique management policies. We use data originating from collaborators (both academic and industry) and data already in the public domain. Eventually, we will use data that we ourselves collect, but for the moment, we can ignore this origin category. 

We need to consider access requirements and restrictions, particularly when using collaborator data. When storing restricted data, it is helpful to remember that all data will eventually be in the public domain.


### Flow

Besides the most raw form, data are dynamic and pluripotent; always awaiting new and improved processing capabilities. We need to understand how each specific data level was processed at the specific moment in time (data provenance), and where each data level is ultimately heading for longer term storage. We also need capabilities to quickly reprocess these data with new approaches. Consider each data processing step as a new research project, waiting for improvement.

Flow also refers to users and data demand. We need to consider data analysis activity at each particular moment. For example, if the data are actively being worked on, multiple people should have immediate access. We need to align data access demand with storage solutions and computability.

## 2. Storage solutions

We consider three categories of potential storage solutions for data:

1. Local storage

   1. Internal hard drive

   2. External hard drive

2. Cloud storage

   1. Image Data Resource (IDR)

   2. Amazon/GC/Azure

   3. Figshare/Figshare+

   4. Zenodo

   5. Github

   6. Github LFS

   7. DVC

   8. Colorado local cluster

   9. One Drive/Dropbox/Google drive

3. No storage

   1. Immediate deletion

Each storage solution has trade-offs in terms of longevity, access, usage speed, version control, size restrictions, and cost (**Table 1**).


## 3. Microscopy Data Levels

From the raw microscopy image to the variable intermediate data types including single cell and bulk embeddings, each data level has unique data storage considerations (**Figure 1**).

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXczKrIlDaJcbfepo0Km4Ufg8grJ0uteSY-0kD4vx_5Xx7ltcLy6aynpYT4MtLISje7v2-XcenqQPOOkPjwHLHZixS4H06VPTH9157Ip4eHhqzn8Xsg9dyUkJuoNgMeaf22yjlPIb7MxQy4oeJ35CoY_pgg?key=rpenezTpWGC_QZlunxvYgg)

Starting with microscopy images, we apply a QC pipeline to select and correct microscopy images for downstream analysis. Next, we apply segmentation pipelines to isolate individual single cells, which form segmentation masks. We have the option to apply a single cell image extraction pipeline to form a dataset of isolated single cell images. We apply representation learning pipelines to extract morphology features from some combination of the corrected microscopy image, segmentation mask, or isolated single cell images. Finally, we apply an aggregated bulk pipeline to turn the single cell morphology embeddings into aggregated bulk embeddings. Importantly, we have different short, mid, and long term storage and sharing solutions for each data type.

|                                                                                        |               |                     |                 |                 |                                                                                                                                              |                                                                                                                                                                      |
| -------------------------------------------------------------------------------------- | ------------- | ------------------- | --------------- | --------------- | -------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Solution**                                                                           | **Longevity** | **Version Control** | **Access**      | **Usage speed** | **Size limits**                                                                                                                              | **Cost**                                                                                                                                                             |
| [Internal hard drive](https://www.dpbestflow.org/data-storage-hardware/hard-drive-101) | Intermediate  | No                  | Private         | Instant         | <= 18TB (Total)                                                                                                                              | \~$15 per TB one time cost ([Details](https://diskprices.com/))                                                                                                      |
| External hard drive                                                                    | High          | No                  | Private         | Download        | <= 18TB (Total)                                                                                                                              | \~$15 per TB one time cost ([Details](https://diskprices.com/))                                                                                                      |
| [IDR](https://idr.openmicroscopy.org/)                                                 | High          | Yes                 | Public          | Download        | >= 2TB (Per dataset)                                                                                                                         | Free                                                                                                                                                                 |
| AWS/GC/Azure                                                                           | Low           | Yes                 | Public/Private  | Instant         | >= 2TB (Per dataset)                                                                                                                         | $0.02 - $0.04 per GB / Month ($40 to $80 per month per 2TB dataset)                                                                                                  |
| [Figshare](https://figshare.com/)                                                      | High          | Yes                 | Public          | Download        | 20GB (Total)                                                                                                                                 | Free ([Details](https://help.figshare.com/article/figshare-account-limits))                                                                                          |
| [Figshare+](https://knowledge.figshare.com/plus)                                       | High          | Yes                 | Public          | Download        | 250GB > x > 5TB (Per dataset)                                                                                                                | $745 > x > $11,860 one time cost ([Details](https://knowledge.figshare.com/plus))                                                                                    |
| [Zenodo](https://zenodo.org/)                                                          | High          | Yes                 | Public          | Download        | >= 50GB (Per dataset)                                                                                                                        | Free ([Details](https://help.zenodo.org/))                                                                                                                           |
| Github                                                                                 | High          | Yes                 | Public/Private  | Instant         | >= 100MB (Per file) ([Details](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github)) | Free                                                                                                                                                                 |
| Github LFS                                                                             | Intermediate  | Yes                 | Public/Private  | Instant         | >= 2GB (up to 5GB for paid plans)                                                                                                            | 50GB data pack for $5 per month ([Details](https://docs.github.com/en/billing/managing-billing-for-git-large-file-storage/about-billing-for-git-large-file-storage)) |
| DVC                                                                                    | Intermediate  | Yes                 | Public/Private  | Download        | None                                                                                                                                         | Cost of linked service (AWS/Azure/GC)                                                                                                                                |
| One drive                                                                              | Low           | Yes                 | Private         | Instant         | >= 5TB (Total)                                                                                                                               | Free to AMC                                                                                                                                                          |
| Dropbox                                                                                | Low           | Yes                 | Public/Private  | Instant         | >= 5TB (Total)                                                                                                                               | $12.50 per user / month ([Details](https://www.dropbox.com/plans))                                                                                                   |
| Google drive                                                                           | Low           | Yes                 | Public/Private  | Instant         | >= 5TB (Total)                                                                                                                               | $25 per month ([Details](https://one.google.com/about/plans))                                                                                                        |
| Local cluster (RMACC)                                                                  | Intermediate  | No                  | Private         | Instant         |                                                                                                                                              |                                                                                                                                                                      |
| Immediate deletion                                                                     | None          | None                | None            | None            | None                                                                                                                                         | None                                                                                                                                                                 |

**Table 1**: Tradeoffs and considerations for data storage solutions.
