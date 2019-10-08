# GenoVic Longitudinal QC 
This project aims to build a longitudinal quality control (QC) pipeline for Clinical data flowing into GenoVic. 

As of September 2019, the scope this pipeline's usage is restricted to
 - Provide a way for GenoVic to independently verify the quality of incoming data. 
 - Provide a way for member to view various QC statistics changes overtime. 

However, we would eventually want the QC statistic collected to be part of the metadata attached to the data in our 
long-term storage to inform data access and release. 



# Implementation
The main components of this pipeline are:
 - Cromwell: Workflow engine to run workflow either on a local machine or on AWS Batch. 
 - Docker images containing the tools on which the pipeline depends.
 - WDL task and workflow definitions.
 - Open source QC tools: 
   - Fastqc
   - SAMtools
   - BCFtools
   - Picard tools
 - MultiQC and MegaQC combo
 

# Run instructions




# Wishlist
 - Customised QC tools. E.g. 
   - Gene specific coverage statistics

# Known Issues
 - AWS Batch token expires for long running Cromwell server.