clear
capture log close
cls

**  GENERAL DO-FILE COMMENTS
**  Program:		SES_BSS_ED_001.do
**  Project:      	Macroscale Walkability- PhD
**  Analyst:		Kern Rocke
**	Date Created:	17/10/2019
**	Date Modified: 	23/10/2019
**  Algorithm Task: Data Preparation and Cleaning of BSS SES data by EDs 2010


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

/*

Main task: Create one working dataset containing all Barbados SES data by EDs
Sub tasks: 
1) Merge sex-specific datasets for each SES category. 
(Note this shoudld utilize 7 different datasets)

2) Merge non-sex specific datasets to sex specific datasets

3) Consider combining all datasets into one final dataset
 Note: Encode all string variables to categorized numeric (in particular: sex)

*/


*Begin merging male data then female then total. 

/////	MALE 	////	

*Load in 1st dataset
use "male_race_SES", clear

*Merge gender specific datasets
foreach x in age education income mactivity wactivity occupation {
merge 1:1 ED using "male_`x'_SES.dta", nogenerate
                    }

*Merge non-gender specific datasets
foreach x in household_size house_tenure single_mother_liveborn ///
			relationship_to_head household_size liveborn crime {
merge 1:1 ED using "`x'_SES.dta", nogenerate
                    }	
drop in 584	

*Save dataset
save "male_SES", replace
	
********************************************************************************
	
/////	FEMALE 	////	
	
*Load in 1st dataset
use "female_race_SES", clear

*Merge gender specific datasets
foreach x in age education income mactivity wactivity occupation {
merge 1:1 ED using "female_`x'_SES.dta", nogenerate
                    }

*Merge non-gender specific datasets
foreach x in household_size house_tenure single_mother_liveborn ///
			relationship_to_head household_size liveborn crime {
merge 1:1 ED using "`x'_SES.dta", nogenerate
                    }	
drop in 584	

*Save dataset
save "female_SES", replace

********************************************************************************

/////	TOTAL 	////	
	
*Load in 1st dataset
use "total_race_SES", clear

*Merge gender specific datasets
foreach x in age education income mactivity wactivity occupation {
merge 1:1 ED using "total_`x'_SES.dta", nogenerate
                    }

*Merge non-gender specific datasets
foreach x in household_size house_tenure single_mother_liveborn ///
			relationship_to_head household_size liveborn crime {
merge 1:1 ED using "`x'_SES.dta", nogenerate
                    }	
drop in 584	

*Save dataset
save "total_SES", replace

********************************************************************************
********************************************************************************

////// MERGING ALL DATA  ///////

*Load in Male data
use "male_SES", clear

*Append using female and total data
append using "female_SES"
append using "total_SES"

*destring sex variable
encode sex, gen(sex1) label(Sex)
drop sex
rename sex1 sex
order ED sex

label data "SES by Ennumeration Districts - Barbabdos Statistical Service"

*Save dataset
save "BSS_SES", replace
