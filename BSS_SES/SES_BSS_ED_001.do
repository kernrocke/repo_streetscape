clear
capture log close
cls

**  GENERAL DO-FILE COMMENTS
**  Program:		SES_BSS_ED_001.do
**  Project:      	Macroscale Walkability- PhD
**  Analyst:		Rocke KD
**  Task:          	Data Preparation and Cleaning of BSS SES data by EDs
**	Date Created:	17/10/2019
**	Date Modified: 	17/10/2019


** DO-FILE SET UP COMMANDS
version 13
clear all
macro drop _all
set more 1
set linesize 200

*Setting working directory
cd "/Users/kernrocke/Documents/Statistical Data Anlaysis/2019/Barbados Statisticl Service/SES/Data"

/*
Note

SES data provided by BSS include the following

1) 	Ethnicity
2) 	Age
3) 	Household size
4) 	House Tenure
5) 	Single Mothers
6) 	Relationship to head of household
7) 	Education
8) 	Yearly pay
9) 	Main activity
10)	Work activity
11)	Liveborn children
12)	Crime
13)	Occupation

*/

*Load in excel data (Ethnicity Origin)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Ethnic Origin") allstring

//////	Ethnicity Origin	//////////

*Male Data
preserve

drop in 1/11
keep if A=="Male" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B race_total
rename C race_black
rename D race_white
rename E race_oriental
rename F race_east_indian
rename G race_middle_eastern
rename H race_mixed
rename I race_other
rename J race_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var race_total "Ethnicity Total"
label var race_black "Black"
label var race_white "White"
label var race_oriental "Oriental"
label var race_east_indian "East Indian"
label var race_middle_eastern "Middle Eastern"
label var race_mixed "Mixed"
label var race_other "Ethnicity Other"
label var race_not_stated "Ethnicity not stated"

save "male_race_SES", replace

restore

********************************************************************************

*Female Data
preserve

drop in 1/11
keep if A=="Female" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B race_total
rename C race_black
rename D race_white
rename E race_oriental
rename F race_east_indian
rename G race_middle_eastern
rename H race_mixed
rename I race_other
rename J race_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var race_total "Ethnicity Total"
label var race_black "Black"
label var race_white "White"
label var race_oriental "Oriental"
label var race_east_indian "East Indian"
label var race_middle_eastern "Middle Eastern"
label var race_mixed "Mixed"
label var race_other "Ethnicity Other"
label var race_not_stated "Ethnicity not stated"

save "female_race_SES", replace

restore
********************************************************************************

*Total Data
preserve

drop in 1/11
keep if A=="Total" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B race_total
rename C race_black
rename D race_white
rename E race_oriental
rename F race_east_indian
rename G race_middle_eastern
rename H race_mixed
rename I race_other
rename J race_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var race_total "Ethnicity Total"
label var race_black "Black"
label var race_white "White"
label var race_oriental "Oriental"
label var race_east_indian "East Indian"
label var race_middle_eastern "Middle Eastern"
label var race_mixed "Mixed"
label var race_other "Ethnicity Other"
label var race_not_stated "Ethnicity not stated"

save "total_race_SES", replace

restore
********************************************************************************
********************************************************************************

*Load in excel data (Age)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Age") allstring clear

/////	Age	//////

*Male
preserve

drop in 1/11
keep if A=="Male" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B age_total
rename C age_median
rename D age_0_9
rename E age_10_19
rename F age_20_29
rename G age_30_39
rename H age_40_49
rename I age_50_59
rename J age_60_69
rename K age_70_79
rename L age_80_89
rename M age_90_99
rename N age_100_over

label var ED "Enumeration District Number"
label var sex "Sex"
label var age_total "Total age"
label var age_median "Median age"
label var age_0_9 "0-9 years"
label var age_10_19 "10-19 years"
label var age_20_29 "20-29 years"
label var age_30_39 "30-39 years"
label var age_40_49 "40-49 years"
label var age_50_59 "50-59 years"
label var age_60_69 "60-69 years"
label var age_70_79 "70-79 years"
label var age_80_89 "80-89 years"
label var age_90_99 "90-99 years"
label var age_100_over "100 years and over"

save "male_age_SES", replace

restore
********************************************************************************

*Female
preserve

drop in 1/11
keep if A=="Female" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B age_total
rename C age_median
rename D age_0_9
rename E age_10_19
rename F age_20_29
rename G age_30_39
rename H age_40_49
rename I age_50_59
rename J age_60_69
rename K age_70_79
rename L age_80_89
rename M age_90_99
rename N age_100_over

label var ED "Enumeration District Number"
label var sex "Sex"
label var age_total "Total age"
label var age_median "Median age"
label var age_0_9 "0-9 years"
label var age_10_19 "10-19 years"
label var age_20_29 "20-29 years"
label var age_30_39 "30-39 years"
label var age_40_49 "40-49 years"
label var age_50_59 "50-59 years"
label var age_60_69 "60-69 years"
label var age_70_79 "70-79 years"
label var age_80_89 "80-89 years"
label var age_90_99 "90-99 years"
label var age_100_over "100 years and over"

save "female_age_SES", replace

restore
********************************************************************************

*Total
preserve

drop in 1/11
keep if A=="Total" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B age_total
rename C age_median
rename D age_0_9
rename E age_10_19
rename F age_20_29
rename G age_30_39
rename H age_40_49
rename I age_50_59
rename J age_60_69
rename K age_70_79
rename L age_80_89
rename M age_90_99
rename N age_100_over

label var ED "Enumeration District Number"
label var sex "Sex"
label var age_total "Total age"
label var age_median "Median age"
label var age_0_9 "0-9 years"
label var age_10_19 "10-19 years"
label var age_20_29 "20-29 years"
label var age_30_39 "30-39 years"
label var age_40_49 "40-49 years"
label var age_50_59 "50-59 years"
label var age_60_69 "60-69 years"
label var age_70_79 "70-79 years"
label var age_80_89 "80-89 years"
label var age_90_99 "90-99 years"
label var age_100_over "100 years and over"

save "total_age_SES", replace

restore
********************************************************************************
********************************************************************************

*Load in excel data (Household Size)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Household Size") allstring clear

/////	Household Size	//////

preserve

drop in 1/4
destring, replace

*Renaming and labelling variabels
rename A ED
rename B hsize_total
rename C hsize_mean
rename D hsize_1Person
rename E hsize_2Person
rename F hsize_3Person
rename G hsize_4Person
rename H hsize_5Person
rename I hsize_6Person
rename J hsize_7Person
rename K hsize_8Person
rename L hsize_9Person
rename M hsize_10Person
rename N hsize_11Person
rename O hsize_12Person
rename P hsize_13Person

label var ED "Enumeration District Number"
label var hsize_total "Household size Total"
label var hsize_mean "Household size Mean"
label var hsize_1Person "Household size 1 person"
label var hsize_2Person "Household size 2 persons"
label var hsize_3Person "Household size 3 persons"
label var hsize_4Person "Household size 4 persons"
label var hsize_5Person "Household size 5 persons"
label var hsize_6Person "Household size 6 persons"
label var hsize_7Person "Household size 7 persons"
label var hsize_8Person "Household size 8 persons"
label var hsize_9Person "Household size 9 persons"
label var hsize_10Person "Household size 10 persons"
label var hsize_11Person "Household size 11 persons"
label var hsize_12Person "Household size 12 persons"
label var hsize_13Person "Household size 13 persons or more"

save "household_size_SES", replace

restore
********************************************************************************
********************************************************************************

*Load in excel data (House Tenure)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Household Tenure") allstring clear

/////	House Tenure	//////

preserve

drop in 1/4
destring, replace

*Renaming and labelling variabels
rename A ED
rename B htenure_total
rename C htenure_owned
rename D htenure_private_rent
rename E htenure_gov_rent
rename F htenure_rent_free
rename G htenure_other
rename H htenure_not_state

label var ED "Enumeration District Number"
label var htenure_total "House Tenure Total"
label var htenure_owned "House Tenure Owned"
label var htenure_private_rent "House Tenure Private Rented or Leased"
label var htenure_gov_rent "House Tenure Government Rented or Leased"
label var htenure_rent_free "House Tenure Rent Free"
label var htenure_other "House Tenure Other"
label var htenure_no_state "House Tenure Not Stated"


save "house_tenure_SES", replace

restore
********************************************************************************
********************************************************************************

*Load in excel data (Single Mothers)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Single Mothers") allstring clear

/////	Single Mother households and total live births	//////

preserve

drop in 1/4
destring, replace

*Renaming and labelling variabels
rename A ED
rename B smother_total
rename C smother_0
rename D smother_1
rename E smother_2
rename F smother_3
rename G smother_4
rename H smother_5
rename I smother_6
rename J smother_7
rename K smother_8
rename L smother_9
rename M smother_10
rename N smother_not_state

label var ED "Enumeration District Number"
label var smother_total "House Tenure Total"
label var smother_0 "0 liveborn"
label var smother_1 "1 liveborn"
label var smother_2 "2 liveborn"
label var smother_3 "3 liveborn"
label var smother_4 "4 liveborn"
label var smother_5 "5 liveborn"
label var smother_6 "6 liveborn"
label var smother_7 "7 liveborn"
label var smother_8 "8 liveborn"
label var smother_9 "9 liveborn"
label var smother_10 "10+ liveborn"
label var smother_not_state "liveborn- Not Stated"

save "single_mother_liveborn_SES", replace

restore
********************************************************************************
********************************************************************************

*Load in excel data (Households and Relationship to Head of household)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Relationship to head") allstring clear

/////	Households and Relationship to Head of household	//////

preserve

drop in 1/4
destring, replace

*Renaming and labelling variabels
rename A ED
rename B rth_total
rename C rth_head
rename D rth_spouse
rename E rth_child_head
rename F rth_child_inlaw
rename G rth_grandchild
rename H rth_parent
rename I rth_other_relative
rename J rth_vistor
rename K rth_non_relative
rename L rth_not_stated


label var ED "Enumeration District Number"
label var rth_total "RTH Total"
label var rth_head "Head"
label var rth_spouse "Spouse/Partner"
label var rth_child_head "Child of Head/Spouse"
label var rth_child_inlaw "Son/Daughter in law"
label var rth_grandchild "Grandchild"
label var rth_parent "Parent/Parent in law"
label var rth_other_relative "Other Relative"
label var rth_vistor "Visitor"
label var rth_non_relative "Other non-relative"
label var rth_not_stated "Relationship to head- Not stated"

save "relationship_to_head_SES", replace

restore
********************************************************************************
********************************************************************************


