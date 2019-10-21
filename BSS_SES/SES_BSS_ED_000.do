clear
capture log close
cls

**  GENERAL DO-FILE COMMENTS
**  Program:		SES_BSS_ED_001.do
**  Project:      	Macroscale Walkability- PhD
**  Analyst:		Kern Rocke
**	Date Created:	21/10/2019
**	Date Modified: 	21/10/2019
**  Algorithm Task: Statistical Analysis Plan


** DO-FILE SET UP COMMANDS
version 13
clear all
macro drop _all
set more 1
set linesize 200


**---------------------------------------------------

/*
ANALYSIS OUTLINE

Development of SES and social depreviaion index scores for Barbados by Enummeration District

Dataset: SES estimates from 2010 Census by ED of Barbados 

Socioeconmic status is integral for determining socioeconomic inequalitites among neighbourhoods and communities in low resource settings.
This is especially important as this may be a driving force for health inequalities and barriers to health access and living in Barbados
Furthermore, in determining walkability and areas in which it should be assessed we plan to use the methods suggested by IPEN in the consideration of
varying levels of walkability and socioeconmic status. 

Proposed statistical analysis technique: Principle component analysis (PCA)

Results from theses analyses well then be categorized into declies whereby deciles 1-4 will be considered low ses and deciles 7-10 will be considered high SES.
This will then be visualized on ED maps for Barbados and study sites for ECHORN. 

The raw estimates which were given will be converted to percentages based on the population size for the respective ennumeration district. 

Measures for SES which will be considered are:
1) Income
2) Education
3) Crime
4) Occupation
5) Work Skill

*/
