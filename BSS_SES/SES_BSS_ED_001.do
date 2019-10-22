clear
capture log close
cls

**  GENERAL DO-FILE COMMENTS
**  Program:		SES_BSS_ED_001.do
**  Project:      	Macroscale Walkability- PhD
**  Analyst:		Kern Rocke
**	Date Created:	17/10/2019
**	Date Modified: 	21/10/2019
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
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Ethnic Origin") allstring clear

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
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("House Tenure") allstring clear

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
rename H htenure_no_state

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

*Load in excel data (Education)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Education") allstring clear

//////	Education	//////////

*Male Data
preserve

drop in 1/11
keep if A=="Male" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B education_total
rename C education_preprimary
rename D education_primary
rename E education_composite
rename F education_secondary
rename G education_post_secondary
rename H education_tertiary
rename I education_other
rename J education_none
rename K education_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var education_total "Education Total"
label var education_preprimary "Preprimary"
label var education_primary "Primary"
label var education_composite "Senior/Composite"
label var education_secondary "Secondary"
label var education_post_secondary "Post Secondary"
label var education_tertiary "Tertiary"
label var education_other "Education- Other"
label var education_none "Education None"
label var education_not_stated "Education not stated"

save "male_education_SES", replace

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
rename B education_total
rename C education_preprimary
rename D education_primary
rename E education_composite
rename F education_secondary
rename G education_post_secondary
rename H education_tertiary
rename I education_other
rename J education_none
rename K education_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var education_total "Education Total"
label var education_preprimary "Preprimary"
label var education_primary "Primary"
label var education_composite "Senior/Composite"
label var education_secondary "Secondary"
label var education_post_secondary "Post Secondary"
label var education_tertiary "Tertiary"
label var education_other "Education- Other"
label var education_none "Education None"
label var education_not_stated "Education not stated"

save "female_education_SES", replace

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
rename B education_total
rename C education_preprimary
rename D education_primary
rename E education_composite
rename F education_secondary
rename G education_post_secondary
rename H education_tertiary
rename I education_other
rename J education_none
rename K education_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var education_total "Education Total"
label var education_preprimary "Preprimary"
label var education_primary "Primary"
label var education_composite "Senior/Composite"
label var education_secondary "Secondary"
label var education_post_secondary "Post Secondary"
label var education_tertiary "Tertiary"
label var education_other "Education- Other"
label var education_none "Education None"
label var education_not_stated "Education not stated"

save "total_education_SES", replace

restore
********************************************************************************
********************************************************************************

*Load in excel data (Yearly Pay)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Yearly Pay") allstring clear

//////	Yearly Pay	//////////

*Male Data
preserve

drop in 1/11
keep if A=="Male" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B income_total
rename C income_median
rename D income_0_49
rename E income_50_99
rename F income_100_149
rename G income_150_199
rename H income_200_over
rename I income_other
rename J income_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var income_total "Income Total"
label var income_median "Median Income"
label var income_0_49 "$0 - 49999"
label var income_50_99 "$50000 - 99999"
label var income_100_149 "$100000 - 149999"
label var income_150_199 "$150000 - 199999"
label var income_200_over "$200000 and over"
label var income_other "Income other"
label var income_not_stated "Income not stated"

save "male_income_SES", replace

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
rename B income_total
rename C income_median
rename D income_0_49
rename E income_50_99
rename F income_100_149
rename G income_150_199
rename H income_200_over
rename I income_other
rename J income_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var income_total "Income Total"
label var income_median "Median Income"
label var income_0_49 "$0 - 49999"
label var income_50_99 "$50000 - 99999"
label var income_100_149 "$100000 - 149999"
label var income_150_199 "$150000 - 199999"
label var income_200_over "$200000 and over"
label var income_other "Income other"
label var income_not_stated "Income not stated"

save "female_income_SES", replace

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
rename B income_total
rename C income_median
rename D income_0_49
rename E income_50_99
rename F income_100_149
rename G income_150_199
rename H income_200_over
rename I income_other
rename J income_not_stated


label var ED "Enumeration District Number"
label var sex "Sex"
label var income_total "Income Total"
label var income_median "Median Income"
label var income_0_49 "$0 - 49999"
label var income_50_99 "$50000 - 99999"
label var income_100_149 "$100000 - 149999"
label var income_150_199 "$150000 - 199999"
label var income_200_over "$200000 and over"
label var income_other "Income other"
label var income_not_stated "Income not stated"

save "total_income_SES", replace

restore
********************************************************************************
********************************************************************************

*Load in excel data (Main Activity)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Main Activity") allstring clear

//////	Main Activity	//////////

*Male Data
preserve

drop in 1/11
keep if A=="Male" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B mactivity_total
rename C mactivity_worked
rename D mactivity_j_notworking
rename E mactivity_look_work
rename F mactivity_home
rename G mactivity_student
rename H mactivity_retired
rename I mactivity_incapacitated
rename J mactivity_other
rename K mactivity_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var mactivity_total "Main Activity Total"
label var mactivity_worked "Main Activity Worked"
label var mactivity_j_notworking "Main Activity With Job Not Working"
label var mactivity_look_work "Main Activity Looked for Work"
label var mactivity_home "Main Activity Home Duties"
label var mactivity_student "Main Activity Student"
label var mactivity_retired "Main Activity Retired"
label var mactivity_incapacitated "Main Activity Incapacitated"
label var mactivity_other "Main Activity Other"
label var mactivity_not_stated "Main Activity Not Stated"

save "male_mactivity_SES", replace

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
rename B mactivity_total
rename C mactivity_worked
rename D mactivity_j_notworking
rename E mactivity_look_work
rename F mactivity_home
rename G mactivity_student
rename H mactivity_retired
rename I mactivity_incapacitated
rename J mactivity_other
rename K mactivity_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var mactivity_total "Main Activity Total"
label var mactivity_worked "Main Activity Worked"
label var mactivity_j_notworking "Main Activity With Job Not Working"
label var mactivity_look_work "Main Activity Looked for Work"
label var mactivity_home "Main Activity Home Duties"
label var mactivity_student "Main Activity Student"
label var mactivity_retired "Main Activity Retired"
label var mactivity_incapacitated "Main Activity Incapacitated"
label var mactivity_other "Main Activity Other"
label var mactivity_not_stated "Main Activity Not Stated"

save "female_mactivity_SES", replace

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
rename B mactivity_total
rename C mactivity_worked
rename D mactivity_j_notworking
rename E mactivity_look_work
rename F mactivity_home
rename G mactivity_student
rename H mactivity_retired
rename I mactivity_incapacitated
rename J mactivity_other
rename K mactivity_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var mactivity_total "Main Activity Total"
label var mactivity_worked "Main Activity Worked"
label var mactivity_j_notworking "Main Activity With Job Not Working"
label var mactivity_look_work "Main Activity Looked for Work"
label var mactivity_home "Main Activity Home Duties"
label var mactivity_student "Main Activity Student"
label var mactivity_retired "Main Activity Retired"
label var mactivity_incapacitated "Main Activity Incapacitated"
label var mactivity_other "Main Activity Other"
label var mactivity_not_stated "Main Activity Not Stated"

save "total_mactivity_SES", replace

restore
********************************************************************************
********************************************************************************

*Load in excel data (Work Activity)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Work Activity") allstring clear

//////	Work Activity	//////////

*Male Data
preserve

drop in 1/11
keep if A=="Male" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B wactivity_total
rename C wactivity_government
rename D wactivity_private_enterprise
rename E wactivity_private_house
rename F wactivity_other
rename G wactivity_unpaid_work
rename H wactivity_paid_help
rename I wactivity_unpaid_help
rename J wactivity_no_work
rename K wactivity_other_2
rename L wactivity_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var wactivity_total "Work Activity Total"
label var wactivity_government "Government Work Activity"
label var wactivity_private_enterprise "Private Enterprise Work Activity"
label var wactivity_private_house "Private household Work Activity"
label var wactivity_other "Other Work Activity"
label var wactivity_unpaid_work "Unpaid Worker Work Activity"
label var wactivity_paid_help "Paid Help Work Activity"
label var wactivity_unpaid_help "Unpaid Help Work Activity"
label var wactivity_no_work "Did not Work Work Activity"
label var wactivity_other_2 "Other 2 Work Activity"
label var wactivity_not_stated "Not stated Work Activity"

save "male_wactivity_SES", replace

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
rename B wactivity_total
rename C wactivity_government
rename D wactivity_private_enterprise
rename E wactivity_private_house
rename F wactivity_other
rename G wactivity_unpaid_work
rename H wactivity_paid_help
rename I wactivity_unpaid_help
rename J wactivity_no_work
rename K wactivity_other_2
rename L wactivity_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var wactivity_total "Work Activity Total"
label var wactivity_government "Government Work Activity"
label var wactivity_private_enterprise "Private Enterprise Work Activity"
label var wactivity_private_house "Private household Work Activity"
label var wactivity_other "Other Work Activity"
label var wactivity_unpaid_work "Unpaid Worker Work Activity"
label var wactivity_paid_help "Paid Help Work Activity"
label var wactivity_unpaid_help "Unpaid Help Work Activity"
label var wactivity_no_work "Did not Work Work Activity"
label var wactivity_other_2 "Other 2 Work Activity"
label var wactivity_not_stated "Not stated Work Activity"

save "female_wactivity_SES", replace

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
rename B wactivity_total
rename C wactivity_government
rename D wactivity_private_enterprise
rename E wactivity_private_house
rename F wactivity_other
rename G wactivity_unpaid_work
rename H wactivity_paid_help
rename I wactivity_unpaid_help
rename J wactivity_no_work
rename K wactivity_other_2
rename L wactivity_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var wactivity_total "Work Activity Total"
label var wactivity_government "Government Work Activity"
label var wactivity_private_enterprise "Private Enterprise Work Activity"
label var wactivity_private_house "Private household Work Activity"
label var wactivity_other "Other Work Activity"
label var wactivity_unpaid_work "Unpaid Worker Work Activity"
label var wactivity_paid_help "Paid Help Work Activity"
label var wactivity_unpaid_help "Unpaid Help Work Activity"
label var wactivity_no_work "Did not Work Work Activity"
label var wactivity_other_2 "Other 2 Work Activity"
label var wactivity_not_stated "Not stated Work Activity"

save "total_wactivity_SES", replace

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

*Load in excel data (Liveborn children)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Liveborn children") allstring clear

/////	Women 15-64 years and Total Liveborn Children	//////

preserve

drop in 1/4
destring, replace

*Renaming and labelling variabels
rename A ED
rename B live_total
rename C live_0
rename D live_1
rename E live_2
rename F live_3
rename G live_4
rename H live_5
rename I live_6
rename J live_7
rename K live_8
rename L live_9
rename M live_10
rename N live_not_stated

label var ED "Enumeration District Number"
label var live_total "Liveborn Children Total"
label var live_0 "0 Liveborn Children"
label var live_1 "1 Liveborn Children"
label var live_2 "2 Liveborn Children"
label var live_3 "3 Liveborn Children"
label var live_4 "4 Liveborn Children"
label var live_5 "5 Liveborn Children"
label var live_6 "6 Liveborn Children"
label var live_7 "7 Liveborn Children"
label var live_8 "8 Liveborn Children"
label var live_9 "9 Liveborn Children"
label var live_10 "10 Liveborn Children"
label var live_not_stated "Liveborn Children Not"


save "liveborn_SES", replace

restore
********************************************************************************
********************************************************************************

*Load in excel data (Crime)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Crime") allstring clear

/////	Crime	//////

preserve

drop in 1/4
destring, replace

*Renaming and labelling variabels
rename A ED
rename B crime_victim
rename C crime_victim_not_stated
rename D crime_murder
rename E crime_kidnapping
rename F crime_shooting
rename G crime_rape
rename H crime_other
rename I crime_robbery
rename J crime_wound
rename K crime_larceny
rename L crime_not_stated

label var ED "Enumeration District Number"
label var crime_victim "Crime victim"
label var crime_victim_not_stated "Crime victim Not Stated"
label var crime_murder "Murder Crime"
label var crime_kidnapping "Kidnapping Crime"
label var crime_shooting "Shooting Crime"
label var crime_rape "Rape/Abuse Crime"
label var crime_other "Other Crime"
label var crime_robbery "Robbery Crime"
label var crime_wound "Wound Crime"
label var crime_larceny "Larceny Crime"
label var crime_not_stated "Crime Not Stated"

save "crime_SES", replace

restore
********************************************************************************
********************************************************************************

*Load in excel data (Occupation)
import excel "/Users/kernrocke/The University of the West Indies/DataGroup - StreetScapes/SES Information/SES_Barbados_Statistical_Service_Census_2010_test.xlsx", sheet("Occupation") allstring clear

//////	Occupation	//////////

*Male Data
preserve

drop AR
drop in 1/9
keep if A=="Male" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B occupation_total
rename C occupation_a_forces
rename D occupation_exec
rename E occupation_admin_mange
rename F occupation_prod_mange
rename G occupation_hosp_mange
rename H occupation_sci_prof
rename I occupation_health_prof
rename J occupation_teach_prof
rename K occupation_busi_prof
rename L occupation_info_prof
rename M occupation_legal_prof
rename N occupation_sci_a_prof
rename O occupation_health_a_prof
rename P occupation_busi_a_prof
rename Q occupation_legal_a_prof
rename R occupation_info_tech
rename S occupation_gen_clerk
rename T occupation_cust_clerk
rename U occupation_num_clerk
rename V occupation_other_clerk
rename W occupation_per_work
rename X occupation_sale_work
rename Y occupation_care_work
rename Z occupation_prot_work
rename AA occupation_mar_agri
rename AB occupation_mar_fores
rename AC occupation_s_farm
rename AD occupation_build_work
rename AE occupation_metal_work
rename AF occupation_handicraft
rename AG occupation_elec_work
rename AH occupation_food_process
rename AI occupation_plant_assemble
rename AJ occupation_drive_oper
rename AK occupation_clean
rename AL occupation_agri_labour
rename AM occupation_mining_labour
rename AN occupation_food_prep
rename AO occupation_street_ser
rename AP occupation_refuse_work
rename AQ occupation_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var occupation_total "Occupation Total"
label var occupation_a_forces "Armed Forces Occupation"
label var occupation_exec "Chief executives, senior officials and legislators Occupation"
label var occupation_admin_mange "Administrative and Commerical Managers Occupation"
label var occupation_prod_mange "Production and Specialised Services Managers Occupation"
label var occupation_hosp_mange "Hospitality Retail and Other Services Managers Occupation"
label var occupation_sci_prof "Science and Engineering Professionals Occupation"
label var occupation_health_prof "Health Professionals Occupation"
label var occupation_teach_prof "Teaching Professionals Occupation"
label var occupation_busi_prof "Business and Administration Professionals Occupation"
label var occupation_info_prof "Information and Communications Technology Professionals Occupation"
label var occupation_legal_prof "Legal, Social and Cultural Professionals Occupation"
label var occupation_sci_a_prof "Science and Engineering Associate Professionals Occupation"
label var occupation_health_a_prof "Health Associate Professionals Occupation"
label var occupation_busi_a_prof "Business and Administration Associate Professionals Occupation"
label var occupation_legal_a_prof "Legal, Social, Cultural and Related Associate Professionals Occupation"
label var occupation_info_tech "Information and Communications Technicians Occupation"
label var occupation_gen_clerk "General and Keyboard Clerks Occupation"
label var occupation_cust_clerk "Customer Services Clerks Occupation"
label var occupation_num_clerk "Numerical and Material Recording Clerks Occupation"
label var occupation_other_clerk "Other Clerical Support Workers Occupation"
label var occupation_per_work "Personal Service Workers Occupation"
label var occupation_sale_work "Sales Workers Occupation"
label var occupation_care_work "Personal Care Workers Occupation"
label var occupation_prot_work "Protective Services Workers Occupation"
label var occupation_mar_agri "Market-oriented Skilled Agricultural Workers Occupation"
label var occupation_mar_fores "Market-oriented Skilled Forestry, Fishery and Hunting Workers Occupation"
label var occupation_s_farm "Subsistence Farmers, Fishers, Hunters and Gatherers Occupation"
label var occupation_build_work "Building and related trades Workers Excluding electricians Occupation"
label var occupation_metal_work "Metal Machinery and Related Trades Workers Occupation"
label var occupation_handicraft "Handicraft and Printing Workers Occupation"
label var occupation_elec_work "Electrical and Electronic Trades Workers Occupation"
label var occupation_food_process "Food Processing, Wood Working, Garment and Other Craft and Related Trades Workers Occupation"
label var occupation_plant_assemble "Stationary Plant and Machine Operators and Assemblers Occupation"
label var occupation_drive_oper "Drivers and Mobile Plant Operators Occupation"
label var occupation_clean "Cleaners and Helpers Occupation"
label var occupation_agri_labour "Agricultural Forestry and Fishery Labourers Occupation"
label var occupation_mining_labour "Labourers in Mining Construction Manufacturing and Transport Occupation"
label var occupation_food_prep "Food Preparation Assistants"
label var occupation_street_ser "Street and Related Sales and Service Workers Occupation"
label var occupation_refuse_work "Refuse Workers and other Elementary Workers Occupation"
label var occupation_not_stated "Occupation Not Stated"

save "male_occupation_SES", replace

restore

********************************************************************************

*Female Data
preserve

drop AR
drop in 1/9
keep if A=="Female" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B occupation_total
rename C occupation_a_forces
rename D occupation_exec
rename E occupation_admin_mange
rename F occupation_prod_mange
rename G occupation_hosp_mange
rename H occupation_sci_prof
rename I occupation_health_prof
rename J occupation_teach_prof
rename K occupation_busi_prof
rename L occupation_info_prof
rename M occupation_legal_prof
rename N occupation_sci_a_prof
rename O occupation_health_a_prof
rename P occupation_busi_a_prof
rename Q occupation_legal_a_prof
rename R occupation_info_tech
rename S occupation_gen_clerk
rename T occupation_cust_clerk
rename U occupation_num_clerk
rename V occupation_other_clerk
rename W occupation_per_work
rename X occupation_sale_work
rename Y occupation_care_work
rename Z occupation_prot_work
rename AA occupation_mar_agri
rename AB occupation_mar_fores
rename AC occupation_s_farm
rename AD occupation_build_work
rename AE occupation_metal_work
rename AF occupation_handicraft
rename AG occupation_elec_work
rename AH occupation_food_process
rename AI occupation_plant_assemble
rename AJ occupation_drive_oper
rename AK occupation_clean
rename AL occupation_agri_labour
rename AM occupation_mining_labour
rename AN occupation_food_prep
rename AO occupation_street_ser
rename AP occupation_refuse_work
rename AQ occupation_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var occupation_total "Occupation Total"
label var occupation_a_forces "Armed Forces Occupation"
label var occupation_exec "Chief executives, senior officials and legislators Occupation"
label var occupation_admin_mange "Administrative and Commerical Managers Occupation"
label var occupation_prod_mange "Production and Specialised Services Managers Occupation"
label var occupation_hosp_mange "Hospitality Retail and Other Services Managers Occupation"
label var occupation_sci_prof "Science and Engineering Professionals Occupation"
label var occupation_health_prof "Health Professionals Occupation"
label var occupation_teach_prof "Teaching Professionals Occupation"
label var occupation_busi_prof "Business and Administration Professionals Occupation"
label var occupation_info_prof "Information and Communications Technology Professionals Occupation"
label var occupation_legal_prof "Legal, Social and Cultural Professionals Occupation"
label var occupation_sci_a_prof "Science and Engineering Associate Professionals Occupation"
label var occupation_health_a_prof "Health Associate Professionals Occupation"
label var occupation_busi_a_prof "Business and Administration Associate Professionals Occupation"
label var occupation_legal_a_prof "Legal, Social, Cultural and Related Associate Professionals Occupation"
label var occupation_info_tech "Information and Communications Technicians Occupation"
label var occupation_gen_clerk "General and Keyboard Clerks Occupation"
label var occupation_cust_clerk "Customer Services Clerks Occupation"
label var occupation_num_clerk "Numerical and Material Recording Clerks Occupation"
label var occupation_other_clerk "Other Clerical Support Workers Occupation"
label var occupation_per_work "Personal Service Workers Occupation"
label var occupation_sale_work "Sales Workers Occupation"
label var occupation_care_work "Personal Care Workers Occupation"
label var occupation_prot_work "Protective Services Workers Occupation"
label var occupation_mar_agri "Market-oriented Skilled Agricultural Workers Occupation"
label var occupation_mar_fores "Market-oriented Skilled Forestry, Fishery and Hunting Workers Occupation"
label var occupation_s_farm "Subsistence Farmers, Fishers, Hunters and Gatherers Occupation"
label var occupation_build_work "Building and related trades Workers Excluding electricians Occupation"
label var occupation_metal_work "Metal Machinery and Related Trades Workers Occupation"
label var occupation_handicraft "Handicraft and Printing Workers Occupation"
label var occupation_elec_work "Electrical and Electronic Trades Workers Occupation"
label var occupation_food_process "Food Processing, Wood Working, Garment and Other Craft and Related Trades Workers Occupation"
label var occupation_plant_assemble "Stationary Plant and Machine Operators and Assemblers Occupation"
label var occupation_drive_oper "Drivers and Mobile Plant Operators Occupation"
label var occupation_clean "Cleaners and Helpers Occupation"
label var occupation_agri_labour "Agricultural Forestry and Fishery Labourers Occupation"
label var occupation_mining_labour "Labourers in Mining Construction Manufacturing and Transport Occupation"
label var occupation_food_prep "Food Preparation Assistants"
label var occupation_street_ser "Street and Related Sales and Service Workers Occupation"
label var occupation_refuse_work "Refuse Workers and other Elementary Workers Occupation"
label var occupation_not_stated "Occupation Not Stated"

save "female_occupation_SES", replace

restore
********************************************************************************

*Total Data
preserve

drop AR
drop in 1/9
keep if A=="Total" 
destring, replace
egen ED = seq()
order ED

*Renaming and labelling variabels
rename A sex
rename B occupation_total
rename C occupation_a_forces
rename D occupation_exec
rename E occupation_admin_mange
rename F occupation_prod_mange
rename G occupation_hosp_mange
rename H occupation_sci_prof
rename I occupation_health_prof
rename J occupation_teach_prof
rename K occupation_busi_prof
rename L occupation_info_prof
rename M occupation_legal_prof
rename N occupation_sci_a_prof
rename O occupation_health_a_prof
rename P occupation_busi_a_prof
rename Q occupation_legal_a_prof
rename R occupation_info_tech
rename S occupation_gen_clerk
rename T occupation_cust_clerk
rename U occupation_num_clerk
rename V occupation_other_clerk
rename W occupation_per_work
rename X occupation_sale_work
rename Y occupation_care_work
rename Z occupation_prot_work
rename AA occupation_mar_agri
rename AB occupation_mar_fores
rename AC occupation_s_farm
rename AD occupation_build_work
rename AE occupation_metal_work
rename AF occupation_handicraft
rename AG occupation_elec_work
rename AH occupation_food_process
rename AI occupation_plant_assemble
rename AJ occupation_drive_oper
rename AK occupation_clean
rename AL occupation_agri_labour
rename AM occupation_mining_labour
rename AN occupation_food_prep
rename AO occupation_street_ser
rename AP occupation_refuse_work
rename AQ occupation_not_stated

label var ED "Enumeration District Number"
label var sex "Sex"
label var occupation_total "Occupation Total"
label var occupation_a_forces "Armed Forces Occupation"
label var occupation_exec "Chief executives, senior officials and legislators Occupation"
label var occupation_admin_mange "Administrative and Commerical Managers Occupation"
label var occupation_prod_mange "Production and Specialised Services Managers Occupation"
label var occupation_hosp_mange "Hospitality Retail and Other Services Managers Occupation"
label var occupation_sci_prof "Science and Engineering Professionals Occupation"
label var occupation_health_prof "Health Professionals Occupation"
label var occupation_teach_prof "Teaching Professionals Occupation"
label var occupation_busi_prof "Business and Administration Professionals Occupation"
label var occupation_info_prof "Information and Communications Technology Professionals Occupation"
label var occupation_legal_prof "Legal, Social and Cultural Professionals Occupation"
label var occupation_sci_a_prof "Science and Engineering Associate Professionals Occupation"
label var occupation_health_a_prof "Health Associate Professionals Occupation"
label var occupation_busi_a_prof "Business and Administration Associate Professionals Occupation"
label var occupation_legal_a_prof "Legal, Social, Cultural and Related Associate Professionals Occupation"
label var occupation_info_tech "Information and Communications Technicians Occupation"
label var occupation_gen_clerk "General and Keyboard Clerks Occupation"
label var occupation_cust_clerk "Customer Services Clerks Occupation"
label var occupation_num_clerk "Numerical and Material Recording Clerks Occupation"
label var occupation_other_clerk "Other Clerical Support Workers Occupation"
label var occupation_per_work "Personal Service Workers Occupation"
label var occupation_sale_work "Sales Workers Occupation"
label var occupation_care_work "Personal Care Workers Occupation"
label var occupation_prot_work "Protective Services Workers Occupation"
label var occupation_mar_agri "Market-oriented Skilled Agricultural Workers Occupation"
label var occupation_mar_fores "Market-oriented Skilled Forestry, Fishery and Hunting Workers Occupation"
label var occupation_s_farm "Subsistence Farmers, Fishers, Hunters and Gatherers Occupation"
label var occupation_build_work "Building and related trades Workers Excluding electricians Occupation"
label var occupation_metal_work "Metal Machinery and Related Trades Workers Occupation"
label var occupation_handicraft "Handicraft and Printing Workers Occupation"
label var occupation_elec_work "Electrical and Electronic Trades Workers Occupation"
label var occupation_food_process "Food Processing, Wood Working, Garment and Other Craft and Related Trades Workers Occupation"
label var occupation_plant_assemble "Stationary Plant and Machine Operators and Assemblers Occupation"
label var occupation_drive_oper "Drivers and Mobile Plant Operators Occupation"
label var occupation_clean "Cleaners and Helpers Occupation"
label var occupation_agri_labour "Agricultural Forestry and Fishery Labourers Occupation"
label var occupation_mining_labour "Labourers in Mining Construction Manufacturing and Transport Occupation"
label var occupation_food_prep "Food Preparation Assistants"
label var occupation_street_ser "Street and Related Sales and Service Workers Occupation"
label var occupation_refuse_work "Refuse Workers and other Elementary Workers Occupation"
label var occupation_not_stated "Occupation Not Stated"

save "total_occupation_SES", replace

restore
********************************************************************************
********************************************************************************