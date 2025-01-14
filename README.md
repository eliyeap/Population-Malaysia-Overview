# Project Background
Over recent decades, Malaysia has undergone substantial demographic shifts. This study examines population changes in Malaysia by estimating and analysing the long-term trends and variabilities of five population metrics: total population, population density, population growth rates, the number of births, and birth rates. Understanding changes in demographic patterns is vital for policymakers and stakeholders to address regional inequalities, meet economic demands, and tackle societal challenges effectively.

Insights and recommendations are provided on the following key areas:
 
- **Malaysian Population Metrics:** Evaluate the annual time series and trends of five population metrics in Malaysia.
- **State Population Metrics:** Evaluate the annual time series and trends of five population metrics for all Malaysian states.

The SQL queries used to inspect and clean the data for this analysis can be found [here](https://github.com/eliyeap/Population-Malaysia-Overview/blob/4a12ef39d845b15e4365db45d9a60a627bdc4e63/Inspect_Clean_Data.sql).

Targed SQL queries regarding various business questions can be found [here](https://github.com/eliyeap/Population-Malaysia-Overview/blob/3aee91bf82b2e05df9c94743c25f1815f361a9b4/EDA.sql).

An interactive Tableau dashboard used to report and explore sales trends can be found [here](https://public.tableau.com/views/PopulationMetricsinMalaysia/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).



# Data Structure & Initial Checks

The main database structure consists of two tables: population_state_raw and birth_state_raw. A description of each table is as follows:

![image](https://github.com/user-attachments/assets/ffa2e9e0-8139-475c-8cef-a6fe91641e70)



# Executive Summary

### Overview of Findings

This study examines the population changes in Malaysia by estimating and analysing the long-term trends and variabilities of five population metrics: total population, population density, population growth rates, the number of births, and birth rates. This study used long-term (2000-2023) data from OpenDOSM to estimates trends across three periods: 2000-2023 (23 years), 2010-2023 (14 years), and 2019-2023 (5 years) to provide a holistic understanding population changes in Malaysia.

Population and population density showed downward trends for all periods over most states except five states (Selangor, Johor, Kuala Lumpur, Melaka, and Perlis). These five states showed upward population trends for all periods attributed to inter-state migration, consistent with downward trends in births and birth rates and declining population trends in the remaining states. The highest upward trends were during 2019-2023, with increases of 146300, 71800, 40100, 19700, and 9800 people/yr in Selangor, Johor, Kuala Lumpur, Melaka, and Perlis, respectively. 

Population growth rates displayed a slightly different pattern compared to population trends. States with downward population trends across all periods showed upward growth rate trends during 2019–2023 caused by a sharp population increase after 2020. In contrast, Selangor, Johor, Kuala Lumpur, Melaka, and Perlis displayed upward trends in population growth rates only during 2010–2023, with rates of -0.01, 0.03, 0.07, 0.02, 0.03, and 0.16 %/yr, respectively. 

The number of births exhibited upward trends in Selangor, Sabah, Terengganu, and Labuan during 2000–2023, with increases of 192.0, 79.38, 222.3, and 4.24 births per year, respectively. However, significant declines were observed across all states during 2010–2023 and 2019–2023, with the steepest decreases during 2019–2023 (except in Pulau Pinang). Birth rates have decreased across all states for all periods. The highest declines happened during 2010–2023 in seven states (Sabah, Perak, Sarawak, Kedah, Kelantan, Pulau Pinang, and Putrajaya) and during 2019–2023 in nine states (Selangor, Johor, Kuala Lumpur, Pahang, Negeri Sembilan, Terengganu, Melaka, Perlis, and Labuan). Selangor and Johor experienced the steepest declines in births (birth rates) of -2652 and -1686 births per year (-0.68 and -0.69 births per 1,000 population per year), respectively.

![image](https://github.com/user-attachments/assets/5cef9960-ebd2-4a76-9c71-b81704557b0b)



# Insights Deep Dive
* The upward population trends in Selangor, Johor, Kuala Lumpur, Melaka, and Perlis for all periods is primarily due to inter-state migration, consistent with the downward trends in births and birth rates and the downward population trends in the remaining states across all periods. Inter-state migration is mostly directed toward Selangor, Johor, and Kuala Lumpur, the major commercial and industrial hubs for better economic opportunities. The population increase in Melaka and Perlis while unknown may be caused by more retirees or immigrants. The most pronounced upward population trends are seen during 2019-2023 with increases of 146300, 71800, 40100, 19700, and 9800 people/yr in Selangor, Johor, Kuala Lumpur, Melaka, and Perlis, respectively. These trends were larger than the corresponding trends during 2000-2023 (2010-2023) by 1.02 (1.10), 1.05 (1.20), 1.07 (1.57), 1.03 (1.21), and 1.27 (2.14) times.

![image](https://github.com/user-attachments/assets/15ec0032-d4f9-4c70-99c3-5398b4672fc5)

* Despite higher population in Selangor, Johor, Kuala Lumpur, Melaka, and Perlis, population growth rates only increased during 2010–2023. During this period, growth rates increased to -0.01, 0.03, 0.07, 0.02, 0.03, and 0.16 %/yr in Selangor, Johor, Kuala Lumpur, Melaka, and Perlis, respectively. These trends were larger than the corresponding trends during 2000-2023 by 0.18, 0.90, 7.62, 0.65, and 2.31 times. Despite a significant increase in 2020, growth rates decreased during 2019–2023 due to below-average growth rates in later years. In contrast, the remaining states showed upward growth trends during 2019–2023 attributed to a rapid increase in growth rates after 2020, with above-average 2023 growth rates.

![image](https://github.com/user-attachments/assets/647f17c9-6c78-4bb9-b460-ec17a39a07d7)

* The number of births showed upward trends of 192.0, 79.38, 222.3, 4.24 births/yr in Selangor, Sabah, Terengganu, and Labuan, respectively during 2000-2023. Births have significantly decreased across all states during 2010–2023 and 2019–2023. The largest declines occurred during 2019–2023 for all states (except Pulau Pinang), where the 2019–2023 trend exceeded the 2010–2023 trend by at least 1.10 times. Selangor, Johor, and Sabah demonstrated higher declines of -2652, -1686, and -1909 births/yr, respectively while Perlis indicated the lowest decline of -71.9 births/yr.

![image](https://github.com/user-attachments/assets/0cb615ee-2d35-4756-9c9b-6039ffa27836)

* Birth rates have decreased across all states for all periods. The largest decreases occurred during 2010–2023 for 7 states (Sabah, Perak, Sarawak, Kedah, Kelantan, Pulau Pinang, and Putrajaya) and during 2019–2023 for 9 states (Selangor, Johor, Kuala Lumpur, Pahang, Negeri Sembilan, Terengganu, Melaka, Perlis, and Labuan). Selangor, Johor, and Kuala Lumpur showed the steepest declines, with birth rates decreasing by -0.68, -0.69, and -0.70 births per 1,000 population per year, respectively, while Sarawak showed the smallest decline at -0.09 births per 1,000 population per year.

![image](https://github.com/user-attachments/assets/92128612-796e-405e-ac4f-10b90bea62e1)



# Recommendations:

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following: 

  ### Economic Development in Other States
  * **Infrastructure development**: Allocate resources to improve urban infrastructure, transportation, and healthcare in states with declining populations to make them more attractive for businesses and residents.
  * **Economic opportunities**: Establish industrial hubs, encourage entrepreneurship, and provide tax incentives for businesses to set up operations in these regions to create job opportunities.
  * **Educational institutions**: Invest in higher education and skill-development centres to attract students and retain young talent, fostering long-term regional development.

  ### Support Families
  * **Childcare support**: Develop affordable and accessible childcare facilities to ease the burden on working parents to encourage them to have more children.
  * **Parental leave policies**: Enhance parental leave policies for both parents to provide financial stability during early child-rearing years.
  * **Financial assistance**: Offer targeted financial incentives (e.g., baby bonuses or subsidies for housing and education) to support families with children.
  * **Awareness campaigns**: Promote the importance of family planning and the benefits of raising children through national campaigns.

  ### Demographic Research
  * Conduct further research to understand the drivers of population increases across states to ensure informed policy decisions.

  ### Monitoring and Forecasting
  * Establish systems to monitor population dynamics and forecast future trends for proactive adjustments to policies and programs.
  
# Assumptions and Caveats:

* Missing population metric data for Putrajaya during 2000-2009. No filling was done for this period.
* Population growth rate measures the percentage change in population between an earlier year and a later year. Thus, there is no population growth rate in 2000.  

