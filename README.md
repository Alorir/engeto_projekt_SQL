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

## Secondary Table Creation
The secondary table was created by joining the "economies" table with the "countries" table based on the common column "country." Only data regarding European countries for the years 2006 – 2018 were included.

## Research Questions
### RQ1: Are wages rising in all industries over the years, or falling in some?
There are 25 instances of decrease in wages in a specific industry branch. In 2013, 11 out of 19 industry branches experienced a decrease in wages compared to the previous year. The industry branches most affected by the decrease in wages are Mining and quarrying (4 years) and Production and distribution of electricity, gas, heat and air conditioning (3 years). A decrease in wages during the observed period did not occur in Manufacturing industry, Health and social care and Other activities. 

### RQ 2: How many liters of milk and kilograms of bread can be bought in the first and last comparable periods in the available price and wage data?
For the average wage in the first comparable period (2006) 1 312 loaves of bread or 1 465 liters of milk can be bought. In the last comparable period (2018) it’s 1 365 loaves of bread and 1669 liters of milk. The price of milk increased less than the price of bread in the observed time period.
RQ 3: Which food category is increasing in price the slowest (has the lowest percentage year-on-year increase)?
The slowest increase in price during the monitored period was crystal sugar, which actually decreased in price since 2006. 

### RQ 4: Has there been a year in which the year-on-year increase in food prices was significantly higher than wage growth (greater than 10%)?
There was no year in the observed time period where the year-on-year increase in food prices was more than 10% higher than wage growth. The highest difference was 6% in 2013.

### RQ 5: Does the level of GDP affect changes in wages and food prices? Or, if the GDP increases more significantly in one year, will this be reflected in food prices or wages in the same or the following year by a more significant increase?
In most years, when GDP increases, there tends to be an increase in average prices as well. For example, in 2007, 2008, 2011, 2012, 2013, 2014, 2015, and 2017, as GDP increases, average prices also increase. However, there are exceptions, such as in 2009 and 2016, where despite a decrease in GDP, prices either decreased (2009) or remained relatively stable (2016). Overall, there seems to be a positive correlation between GDP and prices, but other factors may also influence price movements.
Similar to prices, there is a general trend of salary increases alongside GDP increases. In most years, as GDP increases, average salaries also increase. Again, there are exceptions like in 2013, where despite an increase in GDP, average salaries decreased slightly. Overall, there appears to be a positive correlation between GDP and salaries, suggesting that economic growth may lead to higher wages, but other factors may also play a role.


**Discord username**:  carkoon.

