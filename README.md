# Project Summary Report

## Introduction
The objective of this project was to utilize SQL queries to create primary and secondary tables from available resources and subsequently address specific research inquiries through data analysis derived from these tables. This report contains a brief overview of the available data, description of the process involved in creating the primary and secondary tables, and elaborates of the findings pertinent regarding each research question. Given that the source materials are predominantly in English, the summary report is presented in the same language.

For the purpose of this research, the following tables were available:

**czechia_payroll**: Provides insights into wage trends across various sectors spanning multiple years. The dataset is sourced from the Open Data Portal of the Czech Republic.  
**czechia_payroll_calculation**: An index denoting the calculations applied within the salary table.  
**czechia_payroll_industry_branch**: Identifies the branch number corresponding to entries in the salary table.  
**czechia_payroll_unit**: Indicates the unit count associated with values in the salary table.  
**czechia_payroll_value_type**: Enumerates the value types present in the salary table.  
**czechia_price**: Offers data on the pricing dynamics of select food items over a span of several years. This dataset is also obtained from the Open Data Portal of the Czech Republic.  
**czechia_price_category**: Represents an index of food categories featured in our analysis.  
**czechia_region**: Depicts the region codes of the Czech Republic according to the CZ-NUTS 2 standard.  
**czechia_district**: Enumerates the district numbers of the Czech Republic in accordance with the LAU standard.  
**countries**: Encompasses diverse information about countries worldwide, such as capital cities, currencies, national cuisines, and average population heights.  
**economies**: Provides insights into GDP, GINI coefficient, tax burdens, etc., for a given state and year.  

## Primary Table Approach

Given the nature of our research questions, analysis was focused on entries spanning the years 2006 to 2018, ensuring the availability of substantial data across all tables. It was validated that both the date_from and date_to columns consistently represent the same year for every entry, thus only one of them was incorporated into the primary table. In the foodstuff section of the table, units were retained despite their non-essentiality for the specific research inquiries at hand. However, their inclusion allows for the possibility of catering to hypothetical public relations (PR) department requests for utilizing different food items for illustrative purposes. Primary table was created through CTE. Only the relevant columns were used for the table creation – for the primary table those were *value*, *category_code*, *date_from*, *from czechia_price* table and *value*, *industry_branch_code* and *payroll_year* from the table *czechia_payroll*. Columns *calculation_code* and *unit_code* were used to only extract relevant rows. Columns *price_value*, *price_unit* and name were added to the table. Values in columns *industry_branch_code* and *category_code* were replaced by corresponding names. 
