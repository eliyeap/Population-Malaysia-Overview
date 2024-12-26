# Project Background
Backround about the company, including the industry, active years, business model, and key business metrics. Explain this from the POV of a data analyst who is working at the company.

Insights and recommendations are provided on the following key areas:

- **Category 1:** 
- **Category 2:** 
- **Category 3:** 
- **Category 4:** 

The SQL queries used to inspect and clean the data for this analysis can be found here [link].

Targed SQL queries regarding various business questions can be found here [link].

An interactive Tableau dashboard used to report and explore sales trends can be found here [link].



# Data Structure & Initial Checks

The companies main database structure as seen below consists of four tables: table1, table2, table3, table4, with a total row count of X records. A description of each table is as follows:
- **Table 2:**
- **Table 3:**
- **Table 4:**
- **Table 5:**

[Entity Relationship Diagram here]



# Executive Summary

### Overview of Findings

This study examines the population changes in Malaysia by estimating and analysing the long-term trends and variabilities of five population metrics: total population, population density, population growth rates, the number of births, and birth rates. This study used long-term (2000-2023) data from OpenDOSM to estimates trends across three periods: 2000-2023 (23 years), 2010-2023 (14 years), and 2019-2023 (5 years) to provide a holistic understanding population changes in Malaysia.

Population and population density showed downward trends for all periods over most states except five states (Selangor, Johor, Kuala Lumpur, Melaka, and Perlis). These five states showed upward population trends for all periods attributed to inter-state migration, consistent with downward trends in births and birth rates and declining population trends in the remaining states. The highest upward trends were during 2019-2023, with increases of 146300, 71800, 40100, 19700, and 9800 people/yr in Selangor, Johor, Kuala Lumpur, Melaka, and Perlis, respectively. 

Population growth rates displayed a slightly different pattern compared to population trends. States with downward population trends across all periods showed upward growth rate trends during 2019–2023 caused by a sharp population increase after 2020. In contrast, Selangor, Johor, Kuala Lumpur, Melaka, and Perlis displayed upward trends in population growth rates only during 2010–2023, with rates of -0.01, 0.03, 0.07, 0.02, 0.03, and 0.16 %/yr, respectively. 

The number of births exhibited upward trends in Selangor, Sabah, Terengganu, and Labuan during 2000–2023, with increases of 192.0, 79.38, 222.3, and 4.24 births per year, respectively. However, significant declines were observed across all states during 2010–2023 and 2019–2023, with the steepest decreases during 2019–2023 (except in Pulau Pinang). Birth rates have decreased across all states for all periods. The highest declines happened during 2010–2023 in seven states (Sabah, Perak, Sarawak, Kedah, Kelantan, Pulau Pinang, and Putrajaya) and during 2019–2023 in nine states (Selangor, Johor, Kuala Lumpur, Pahang, Negeri Sembilan, Terengganu, Melaka, Perlis, and Labuan). Selangor and Johor experienced the steepest declines in births (birth rates) of -2652 and -1686 births per year (-0.68 and -0.69 births per 1,000 population per year), respectively.

# Insights Deep Dive
* The upward population trends in Selangor, Johor, Kuala Lumpur, Melaka, and Perlis for all periods is primarily due to inter-state migration, consistent with the downward trends in births and birth rates and the downward population trends in the remaining states across all periods. Inter-state migration is mostly directed toward Selangor, Johor, and Kuala Lumpur, the major commercial and industrial hubs for better economic opportunities. The population increase in Melaka and Perlis while unknown may be caused by more retirees or immigrants. The most pronounced upward population trends are seen during 2019-2023 with increases of 146300, 71800, 40100, 19700, and 9800 people/yr in Selangor, Johor, Kuala Lumpur, Melaka, and Perlis, respectively. These trends were larger than the corresponding trends during 2000-2023 (2010-2023) by 1.02 (1.10), 1.05 (1.20), 1.07 (1.57), 1.03 (1.21), and 1.27 (2.14) times.

* Despite higher population in Selangor, Johor, Kuala Lumpur, Melaka, and Perlis, population growth rates only increased during 2010–2023. During this period, growth rates increased to -0.01, 0.03, 0.07, 0.02, 0.03, and 0.16 %/yr in Selangor, Johor, Kuala Lumpur, Melaka, and Perlis, respectively. These trends were larger than the corresponding trends during 2000-2023 by 0.18, 0.90, 7.62, 0.65, and 2.31 times. Despite a significant increase in 2020, growth rates decreased during 2019–2023 due to below-average growth rates in later years. In contrast, the remaining states showed upward growth trends during 2019–2023 attributed to a rapid increase in growth rates after 2020, with above-average 2023 growth rates.

* The number of births showed upward trends of 192.0, 79.38, 222.3, 4.24 births/yr in Selangor, Sabah, Terengganu, and Labuan, respectively during 2000-2023. Births have significantly decreased across all states during 2010–2023 and 2019–2023. The largest declines occurred during 2019–2023 for all states (except Pulau Pinang), where the 2019–2023 trend exceeded the 2010–2023 trend by at least 1.10 times. Selangor, Johor, and Sabah demonstrated higher declines of -2652, -1686, and -1909 births/yr, respectively while Perlis indicated the lowest decline of -71.9 births/yr.

* Birth rates have decreased across all states for all periods. The largest decreases occurred during 2010–2023 for 7 states (Sabah, Perak, Sarawak, Kedah, Kelantan, Pulau Pinang, and Putrajaya) and during 2019–2023 for 9 states (Selangor, Johor, Kuala Lumpur, Pahang, Negeri Sembilan, Terengganu, Melaka, Perlis, and Labuan). Selangor, Johor, and Kuala Lumpur showed the steepest declines, with birth rates decreasing by -0.68, -0.69, and -0.70 births per 1,000 population per year, respectively, while Sarawak showed the smallest decline at -0.09 births per 1,000 population per year.

# Recommendations:

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following: 

*** Economic Development in Other States**
* Infrastructure Development: Allocate resources to improve transportation, healthcare, and urban infrastructure in states with declining populations to make them more attractive for businesses and residents.
* Economic Opportunities: Establish industrial hubs, encourage entrepreneurship, and provide tax incentives for businesses to set up operations in these regions to create job opportunities.
* Educational Institutions: Invest in higher education and skill-development centres to attract students and retain young talent, fostering long-term regional development.

* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Assumption 1 (ex: missing country records were for customers based in the US, and were re-coded to be US citizens)
  
* Assumption 1 (ex: data for December 2021 was missing - this was imputed using a combination of historical trends and December 2020 data)
  
* Assumption 1 (ex: because 3% of the refund date column contained non-sensical dates, these were excluded from the analysis)
