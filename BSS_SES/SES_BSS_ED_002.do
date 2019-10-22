clear
capture log close
cls

**  GENERAL DO-FILE COMMENTS
    **  Program:		SES_BSS_ED_002.do
    **  Project:      	Macroscale Walkability- PhD
    **  Analyst:		Kern Rocke
    **	Date Created:	21/10/2019
    **	Date Modified: 	21/10/2019
    **  Algorithm Task: Merging of BSS SES data by EDs 2010 from SES_BSS_ED_001


** DO-FILE SET UP COMMANDS
version 13
clear all
macro drop _all
set more 1
set linesize 200

*Setting working directory
cd "/Users/kernrocke/Documents/Statistical Data Anlaysis/2019/Barbados Statisticl Service/SES/Data" 

/*

Main task: Create one working dataset containing all Barbados SES data by EDs
Sub tasks: 
1) Merge sex-specific datasets for each SES category. (Note this shoudl create 13 different datasets)
2) Encode all string variables to categorized numeric (in particular: sex)

*/

********************************************************************************

//////	Ethnicity Origin	//////////

*Load in Ethnicity data
use "male_race_SES", clear
append using "female_race_SES"

*destring sex variable
encode sex, gen(sex1) label(Sex)
drop sex
rename sex1 sex
order ED sex

save "race_SES", replace

********************************************************************************

//////	Age Origin	//////////

*Load in Age data
use "male_age_SES", clear
append using "female_age_SES"

*destring sex variable
encode sex, gen(sex1) label(Sex)
drop sex
rename sex1 sex
order ED sex

save "age_SES", replace

********************************************************************************

//////	Education	//////////

*Load in Education data
use "male_education_SES", clear
append using "female_education_SES"

*destring sex variable
encode sex, gen(sex1) label(Sex)
drop sex
rename sex1 sex
order ED sex

save "education_SES", replace

********************************************************************************

//////	Yearly Pay	//////////

*Load in Yearly Pay data
use "male_income_SES", clear
append using "female_income_SES"

*destring sex variable
encode sex, gen(sex1) label(Sex)
drop sex
rename sex1 sex
order ED sex

save "income_SES", replace

********************************************************************************