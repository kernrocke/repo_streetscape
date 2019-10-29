clear
capture log close
cls

//Note: This algorithm can only be run after SES_BSS_ED_002

**  GENERAL DO-FILE COMMENTS
**  Program:		SES_BSS_ED_002.do
**  Project:      	Macroscale Walkability- PhD
**  Analyst:		Kern Rocke
**	Date Created:	28/10/2019
**	Date Modified: 	29/10/2019
**  Algorithm Task: Correlations and Inital PCA Analysis


** DO-FILE SET UP COMMANDS
version 13
clear all
macro drop _all
set more 1
set linesize 80

*Setting working directory
** Dataset to encrypted location
local datapath "/Volumes/Secomba/kernrocke/Boxcryptor/DataGroup - repo_data/data_p145"
** Logfiles to unencrypted location
local logpath X:/OneDrive - The University of the West Indies/repo_datagroup/repo_p145



** ------------------------------------------
** FILE 1- DATA PREPARATION
** ------------------------------------------

use "`datapath'/version01/2-working/BSS_SES/BSS_SES_002", clear

**Initalize macros
<<<<<<< HEAD
global xlist per_m_race_black - per_t_occupation_refuse_work hsize_mean f_income_median f_age_median m_income_median m_age_median t_age_median t_income_median	
=======
global xlist per_m_race_black - per_t_occupation_refuse_work ////
			hsize_mean f_income_median f_age_median m_income_median ///
			m_age_median t_age_median t_income_median	
>>>>>>> 57459abd692ca6287b1e7404d6a38dec35e71f42
global ED

** Describe SES categories
des $xlist
sum $xlist
corr $xlist

**Correlations between SES categories
preserve
matrix CORR = r(C) 
mata
    a=st_matrix("CORR")
    LCORR=vech(a)
    CORR = st_matrix("CORR", LCORR)
end
svmat CORR
keep CORR 
drop if CORR == 1 
gen ind = _n

    ** Plot the correlations --> INDEX PLOT
    ** To visually show the correlation sizes 
    #delimit ;
	gr twoway
		/// Correlation
		(sc CORR ind , msize(3.5) m(o) mlc(gs0) mfc("161 217 155 %75") mlw(0.1))
		,
			graphregion(color(gs16)) 
            ysize(5) xsize(10)

			xlab(0(5000)52000 , labs(3) tlc(gs0) labc(gs0) nogrid glc(gs16))
			xscale(fill lc(gs0))
			xtitle("Correlations", size(3) color(gs0) margin(l=2 r=2 t=5 b=2))
			xmtick(0(5000)52050, tlc(gs0))

			ylab(-1.0(0.1)1.0
			,
			valuelabel labc(gs0) labs(3) tstyle(major_notick) nogrid glc(gs16) angle(0) format(%9.2f))
			yscale(noline lw(vthin) )
			ytitle("", size(3) margin(l=2 r=5 t=2 b=2))

            yline(0, lc(gs2 ) lp("-"))

			legend(off size(3) position(12) ring(1) bm(t=1 b=4 l=5 r=0) colf cols(1)
			region(fcolor(gs16) lw(vthin) margin(l=2 r=2 t=2 b=2))
			order(2 3 4)
			lab(2 "Min 30q70")
			lab(3 "Max 30q70")
			lab(4 "Regional 30q70")
            )
            name(corelations)
            ;
    #delimit cr
restore

<<<<<<< HEAD
*
=======
*Inital PCA analysis
paran $xlist

pca $xlist

*Orthogonal rotation
rotate, varimax blanks(0.3)

*Oblique rotation
rotate, promax blanks(0.3)

**Adding loadings estimates to the existing dataset
estat loadings
predict ses_score

**KMO measure for sampling adequacy
**Note: values 0.70 and higher are desireable 
estat kmo 

**Summary of ses index scores
sum ses_score

**Categorize SES index scores into deciles
xtile ses_dec, nq(10)

**Categorize deciles into high and low SES
gen ses_cat = ses_dec
recode ses_cat (1/4=3) (5/6=2) (7/10=1)
label var ses_cat "Socioeconomic Index Categories"
label define ses_cat 3"High" 1"Low" 2"Medium"
label value ses_cat ses_cat

**Tabulate SES by ED and parishes
tab ses_cat ED
tab ses_cat parish
>>>>>>> 57459abd692ca6287b1e7404d6a38dec35e71f42
