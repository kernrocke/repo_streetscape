clear
capture log close
cls

//Note: This algorithm can only be run after SES_BSS_ED_002

**  GENERAL DO-FILE COMMENTS
**  Program:		SES_BSS_ED_003.do
**  Project:      	Macroscale Walkability- PhD
**  Analyst:		Kern Rocke
**	Date Created:	24/10/2019
**	Date Modified: 	05/11/2019
**  Algorithm Task: Creating SES variables for PCA analysis


** DO-FILE SET UP COMMANDS
version 13
clear all
macro drop _all
set more 1
set linesize 80

*Setting working directory
** Dataset to encrypted location
/*
WINDOWS OS
local datapath "X:/The University of the West Indies/DataGroup - repo_data/data_p145"
*/
*MAC OS
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
use "`datapath'/version01/2-working/BSS_SES/BSS_SES_001", clear

*********************************************************************
*Convert Ethnicity variables to percentages

foreach x in black white oriental east_indian middle_eastern ///
            mixed other {
gen per_m_race_`x' = (m_race_`x' / m_race_total)*100
gen per_f_race_`x' = (f_race_`x' / f_race_total)*100
gen per_t_race_`x' = (t_race_`x' / t_race_total)*100

label var per_m_race_`x' "Male Percentage Race `x'"
label var per_f_race_`x' "Female Percentage Race `x'"
label var per_t_race_`x' "Total Percentage Race `x'"
            }

*********************************************************************
*Convert Age variables to percentages

foreach x in 0_9 10_19 20_29 30_39 40_49 50_59 60_69 70_79 80_89 ///
             90_99 100_over {
gen per_m_age_`x' = (m_age_`x' / m_age_total)*100
gen per_f_age_`x' = (f_age_`x' / f_age_total)*100
gen per_t_age_`x' = (t_age_`x' / t_age_total)*100

label var per_m_age_`x' "Percentage Male Percentage Age `x'"
label var per_f_age_`x' "Percentage Female Percentage Age `x'"
label var per_t_age_`x' "Percentage Total Percentage Age `x'"
             }

*********************************************************************
*Convert Household Size variables to percentages

foreach x in 1Person 2Person 3Person 4Person 5Person 6Person ///
             7Person  8Person 9Person 10Person 11Person 12Person ///
             13Person {

gen per_hsize_`x' = (hsize_`x' / hsize_total)*100

label var per_hsize_`x' "Percentage Household Size `x's"
             }
             
*********************************************************************
*Convert House Tenure variables to percentages

foreach x in owned private_rent gov_rent rent_free other {

gen per_htenure_`x' = (htenure_`x' / htenure_total)*100

label var per_htenure_`x' "Percentage House Tenure `x'"
            }
                        
*********************************************************************
/*  Converting Single Mother Househilds and total live births variables 
    to percentages  */

foreach x in 0 1 2 3 4 5 6 7 8 9 10 {

gen per_smother_`x' = (smother_`x' / smother_total)*100

label var per_smother_`x' "Percentage Single Mother `x' liveborn"
            }
                                    
*********************************************************************
/*  Converting Househilds and Relationship to Head of household variables
    to percentages */

foreach x in head spouse child_head child_inlaw grandchild parent ///
            other_relative vistor non_relative {

gen per_rth_`x' = (rth_`x' / rth_total)*100

label var per_rth_`x' "Percentage RTH `x'"
            }
                                     
*********************************************************************
*Convert Education variables to percentages

foreach x in preprimary primary composite secondary post_secondary ///
            tertiary other none {
gen per_m_education_`x' = (m_education_`x' / m_education_total)*100
gen per_f_education_`x' = (f_education_`x' / f_education_total)*100
gen per_t_education_`x' = (t_education_`x' / t_education_total)*100

label var per_m_education_`x' "Male Percentage Education `x'"
label var per_f_education_`x' "Female Percentage Education `x'"
label var per_t_education_`x' "Total Percentage Education `x'"
            }
                                                 
*********************************************************************
*Convert Yearly Pay (Income) variables to percentages

foreach x in 0_49 50_99 100_149 150_199 200_over  {

gen per_m_income_`x' = (m_income_`x' / m_income_total)*100
gen per_f_income_`x' = (f_income_`x' / f_income_total)*100
gen per_t_income_`x' = (t_income_`x' / t_income_total)*100

label var per_m_income_`x' "Male Percentage Income $`x' ($xxx,000)"
label var per_f_income_`x' "Female Percentage Income $`x' ($xxx,000)"
label var per_t_income_`x' "Total Percentage Income $`x' ($xxx,000)"
            }
                                                 
*********************************************************************
*Convert Main Activity variables to percentages

foreach x in worked j_notworking look_work home student retired  ///
            incapacitated other {

gen per_m_mactivity_`x' = (m_mactivity_`x' / m_mactivity_total)*100
gen per_f_mactivity_`x' = (f_mactivity_`x' / f_mactivity_total)*100
gen per_t_mactivity_`x' = (t_mactivity_`x' / t_mactivity_total)*100

label var per_m_mactivity_`x' "Male Percentage Main Activity `x'"
label var per_f_mactivity_`x' "Female Percentage Main Activity `x'"
label var per_t_mactivity_`x' "Total Percentage Main Activity `x'"
            }
                                                 
*********************************************************************
*Convert Work Activity variables to percentages

foreach x in government private_enter private_house other   ///
            unpaid_work paid_help unpaid_help no_work other_2 {
                
gen per_m_wactivity_`x' = (m_wactivity_`x' / m_wactivity_total)*100
gen per_f_wactivity_`x' = (f_wactivity_`x' / f_wactivity_total)*100
gen per_t_wactivity_`x' = (t_wactivity_`x' / t_wactivity_total)*100

label var per_m_wactivity_`x' "Male Percentage Work Activity `x'"
label var per_f_wactivity_`x' "Female Percentage Work Activity `x'"
label var per_t_wactivity_`x' "Total Percentage Work Activity `x'"
            }
                                                 
*********************************************************************
/*  Converting Women 15-64 years and Total Liveborn children variables 
    to percentages  */

foreach x in 0 1 2 3 4 5 6 7 8 9 10 {

gen per_live_`x' = (live_`x' / live_total)*100

label var per_live_`x' "Percentage Women 15-64 `x' liveborn children"
            }
                                    
*********************************************************************
/*  Crime variables to percentages  */

foreach x in victim murder kidnapping shooting rape other ///
            robbery wound larceny {

gen per_crime_`x' = (crime_`x' / t_race_total)*100

label var per_crime_`x' "Percentage `x' Crime"
            }
                                    
*********************************************************************
*Convert Occupation variables to percentages

foreach x in a_forces exec admin_mange prod_mange hosp_mange   ///
            sci_prof health_prof teach_prof busi_prof info_prof ///
            legal_prof sci_a_prof health_a_prof busi_a_prof ///
            legal_a_prof info_tech gen_clerk cust_clerk num_clerk ///
            other_clerk per_work sale_work care_work prot_work ///
            mar_agri mar_fores s_farm build_work metal_work ///
            handicraft elec_work food_process plant_assemble ///
            drive_oper clean agri_labour mining_labour food_prep ///
            street_ser refuse_work {
                
gen per_m_occupation_`x' = (m_occupation_`x' / m_occupation_total)*100
gen per_f_occupation_`x' = (f_occupation_`x' / f_occupation_total)*100
gen per_t_occupation_`x' = (t_occupation_`x' / t_occupation_total)*100

label var per_m_occupation_`x' "Male Percentage `x' Occupation"
label var per_f_occupation_`x' "Female Percentage `x' Occupation"
label var per_t_occupation_`x' "Total Percentage `x' Occupation"
             }
                                                 
*********************************************************************
*Convert Martial Status variables to percentages

foreach x in married separated divorced widowed n_married {

gen per_marital_`x' = (marital_`x' / total_pop)
label var per_marital_`x' "Percentage Marital `x'"
}

*********************************************************************
*Convert Religion variables to percentages

foreach x in adventist anglican bahal baptist bretheren church_lord ///
			hindu jewish jevovah_wit methodist moravian mormon muslim ///
			pentecostal rasta catholic salvation other_chris none no{

gen per_religion_`x' = (religion_`x' / total_pop)
label var per_religion_`x' "Percentage Religion `x'"
}
                                                 
*********************************************************************
*Convert Number of rooms variables to percentages

foreach x in 1 2 3 4 5 6 7 8 9_more {

gen per_rooms_`x' = (rooms_`x' / total_pop)
label var per_rooms_`x' "Percentage Number of Rooms `x'"
}
                                                 
*********************************************************************
*Convert Number of bedrooms variables to percentages

foreach x in 1 2 3 4 5_more {

gen per_bedrooms_`x' = (bedrooms_`x' / total_pop)
label var per_bedrooms_`x' "Percentage Number of Bedrooms `x'"
}
                                                 
*********************************************************************
*Convert Number of bathrooms variables to percentages

foreach x in 1 2 3 shared {

gen per_bathroom_`x' = (bathroom_`x' / total_pop)
label var per_bathroom_`x' "Percentage Number of Bathrooms `x'"
}

*********************************************************************
*Convert Sewage variables to percentages

foreach x in wc_sewer wc_no_sewer other_toilet pit no_toilet //
			shared_toilet electricity {

gen per_sewage_`x' = (sewage_`x' / total_pop)
label var per_sewage_`x' "Percentage Sewage `x'"
}

*********************************************************************
*Convert Number of vehicles variables to percentages

foreach x in 1 2 3 4_more {

gen per_vehicles_`x' = (vehicles_`x' / total_pop)
label var per_vehicles_`x' "Percentage Number of Vehicles `x'"
}
                                                 
*********************************************************************
*Convert Electricity and Emigrants variables to percentages

foreach x in electricity emigrants {

gen per_`x' = (`x' / total_pop)
label var per_`x' "Percentage Persons with `x'"
}
                                                 
*********************************************************************
*Convert Amentities variables to percentages

foreach x in stove fridge freezer water_tank microwave toaster wash ///
			dish_wash dryer fixed_line tv radio cabel_tv stero_system 
			computer {

gen per_amentites_`x' = (amentites_`x' / total_pop)
label var per_amentites_`x' "Percentage Persons Amentities (`x')"
}
                                                 
*********************************************************************


*Save dataset
save "`datapath'/version01/2-working/BSS_SES/BSS_SES_002", replace
