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
local datapath "/Volumes/Secomba/kernrocke/Boxcryptor/DataGroup - repo_data/data_p145"
** Logfiles to unencrypted location
local logpath X:/OneDrive - The University of the West Indies/repo_datagroup/repo_p145

/*
This algorithm will attempt to utilize all possible combinations of SES variables derived from the SES Census 2010 data.

Possible SES variables needed for the computation of the SES index

Unemployed
<Seondary education
Management occupations (Male/Female)
<$49999 Yearly income (Male/Female)
Female headed households 
Non blacks

*/



*Load in dataset
use "`datapath'/version01/2-working/BSS_SES/BSS_SES", clear

*Covert Ethnicity variables to percentages

foreach x in black white oriental east_indian middle_eastern ///
            mixed other {
gen per_m_race_`x' = (m_race_`x' / m_race_total)*100
gen per_f_race_`x' = (f_race_`x' / f_race_total)*100
gen per_t_race_`x' = (t_race_`x' / t_race_total)*100

label var per_m_race_`x' "Male Percentage `x'"
label var per_f_race_`x' "Female Percentage `x'"
label var per_m_race_`x' "Male Percentage `x'"
            }