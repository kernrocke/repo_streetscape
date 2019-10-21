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

