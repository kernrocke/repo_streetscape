
# DO-FILE METADATA
# Program:	     SES_BSS_ED.py
# Project:	     Macroscale Walkability - PhD
# Analyst:	     Kern Rocke
# Date Created:	 11/11/2019
# Date Modified: 11/11/2019
# Algoithm Task: Creating File Geodatabase for SES Ennumeration Mapping

#Import system modules
import arcpy

# Set environment settings
arcpy.env.workspace = 'C:\Users\810000689\Documents\ArcGIS\Default.gdb'

# Set local variables
out_folder_path = "C:\Users\810000689\The University of the West Indies\DataGroup - repo_data\data_p145\version01\1-input\GIS Data"
out_name = "SES_BSS_ED.gdb"

datapath = "C:\Users\810000689\Documents\ArcGIS\Default.gdb"

#Features 
inFeatures = ["ED_SES", "parish1", "HoTN_ED_Boundary_2010", "ECHORN_ED_Boundary_2010" ]
outlocation = 'C:\Users\810000689\The University of the West Indies\DataGroup - repo_data\data_p145\version01\1-input\GIS Data\SES_BSS_ED.gdb'

# Create File Geodatabase
arcpy.CreateFileGDB_management(out_folder_path, out_name)

# Importing Features to File Geodatabase
arcpy.FeatureClassToGeodatabase_conversion(inFeatures, outlocation)

