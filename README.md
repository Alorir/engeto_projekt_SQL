## Food Affordability and Wage Analysis in the Czech Republic

📌 Project Overview
This project analyzes the affordability of basic food items in the Czech Republic by comparing wage trends and food prices over multiple years. The goal is to provide insights into how economic factors impact the purchasing power of citizens.

🔍 Research Questions Addressed
Do wages increase consistently across all industries?
How has the purchasing power of essential goods (milk, bread) changed over time?
Which food category has the slowest price increase?
Were there years when food prices rose significantly faster than wages?
Does GDP growth correlate with changes in wages and food prices?

📊 Data Sources
The analysis uses publicly available datasets from the Czech Open Data Portal, including:

czechia_payroll: Provides insights into wage trends across various sectors spanning multiple years. The dataset is sourced from the Open Data Portal of the Czech Republic.\
czechia_payroll_calculation: An index denoting the calculations applied within the salary table.\
czechia_payroll_industry_branch: Identifies the branch number corresponding to entries in the salary table.\
czechia_payroll_unit: Indicates the unit count associated with values in the salary table.\
czechia_payroll_value_type: Enumerates the value types present in the salary table.\
czechia_price: Offers data on the pricing dynamics of select food items over a span of several years. This dataset is also obtained from the Open Data Portal of the Czech Republic.\
czechia_price_category: Represents an index of food categories featured in our analysis.\
czechia_region: Depicts the region codes of the Czech Republic according to the CZ-NUTS 2 standard.\
czechia_district: Enumerates the district numbers of the Czech Republic in accordance with the LAU standard.\
countries: Encompasses diverse information about countries worldwide, such as capital cities, currencies, national cuisines, and average population heights.\
economies: Provides insights into GDP, GINI coefficient, tax burdens, etc., for a given state and year.\


🛠 Project Deliverables
Two structured SQL tables:
Unified wage and food price dataset for Czechia.
Additional economic indicators for European countries.
SQL scripts to extract key insights and answer research questions.
Data quality report highlighting missing values or inconsistencies.
