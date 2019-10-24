clear
capture log close
cls

**  GENERAL DO-FILE COMMENTS
**  Program:		SES_BSS_ED_002.do
**  Project:      	Macroscale Walkability- PhD
**  Analyst:		Kern Rocke
**	Date Created:	24/10/2019
**	Date Modified: 	24/10/2019
**  Algorithm Task: Creating SES variables for PCA analysis


** DO-FILE SET UP COMMANDS
version 13
clear all
macro drop _all
set more 1
set linesize 200

*Setting working directory
** Dataset to encrypted location
local datapath "X:/The University of the West Indies/DataGroup - repo_data/data_p145/BSS_SES"
** Logfiles to unencrypted location
local logpath X:/OneDrive - The University of the West Indies/repo_datagroup/repo_p145

*Load in dataset
use "BSS_SES", clear

