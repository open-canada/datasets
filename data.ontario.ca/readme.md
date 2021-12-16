Open Ontario Databases provides API which can be used to find and access data as shown below.
See  [L&L in June dedicated to CKAN](https://github.com/open-canada/lunch_and_learn_opengov/). 


```
library(ckanr); 

ckanr_setup(url = "https://data.ontario.ca/")
resource_search(q = "name:Vaccin")$results # COVID, Vital, Hospital

res <-resource_show(id ="274b819c-5d69-4539-a4db-f2950794138c")
res$url
destfile <- "Hospitalizations by vaccination status.csv"
curl::curl_download(res$url, destfile)
```

This folder provides cached copies of some of Open Ontario Databases - for easier use and practicing while leaning R and building tools to visualize those data. Alternatively, you can also download them directly from https://data.ontario.ca/ by Googling the dataset Name.

To read them,use this code:
```
dt <- data.table::fread("https://github.com/open-canada/datasets/raw/main/data.ontario.ca/Hospitalizations%20by%20vaccination%20status.csv")
```

<!-- 

The following datasets are cached in this folder (all extracted with code provided above)


[[5]] ***
<CKAN Resource> 274b819c-5d69-4539-a4db-f2950794138c 
  Name: Hospitalizations by vaccination status
  Description: * This is a new data collection and the data quality will continue to improve as hospitals continue to submit data.
* In order to understand the vaccination status of patients currently hospitalized, a new data collection process was developed and this may cause discrepancies between other hospitalization numbers being collected using a different data collection process.
* Data on patients in ICU are being collected from two different data sources with different extraction times and public reporting cycles. The existing data source (Critical Care Information System, CCIS) does not have vaccination status. 
* Historical data for hospitalizations by region may change over time as hospitals update previously entered data.
* Due to incomplete weekend and holiday reporting, vaccination status data for hospital and ICU admissions is not updated on Sundays, Mondays and the day after holidays
* Unvaccinated is defined as not having any dose, or between 0-13 days after administration of the first dose of a COVID-19 vaccine
* Partially vaccinated is defined as 14 days or more after the first dose of a 2-dose series COVID-19 vaccine, or between 0-13 days after administration of the second dose
* Fully vaccinated is defined as 14 days or more after receipt of the second dose of a 2-dose series COVID-19 vaccine
  Creator/Modified: 2021-08-20T14:29:47.628879 / 2021-12-15T14:16:14.713347
  Size: 3769
  Format: CSV
 
[[4]]
<CKAN Resource> eed63cf2-83dd-4598-b337-b288c0a89a16 
  Name: Cases and rates by vaccination status
  Description: Effective September 13, 2021, individuals are considered fully vaccinated if they have had two doses and the second dose was at least fourteen days ago. Individuals are considered partially vaccinated if they have had one dose at least fourteen days ago, or two doses where the second dose was less than fourteen days ago. Individuals are considered unvaccinated if they have not had a dose, or if their first dose was less than fourteen days ago.
  
[[6]] ***
<CKAN Resource> c08620e0-a055-4d35-8cec-875a459642c3 
  Name: Case rates by vaccination status and age group
  Description: Effective September 13, 2021, individuals are considered fully vaccinated if they have had two doses and the second dose was at least fourteen days ago. Individuals are considered partially vaccinated if they have had one dose at least fourteen days ago, or two doses where the second dose was less than fourteen days ago. Individuals are considered unvaccinated if they have not had a dose, or if their first dose was less than fourteen days ago.
 


[[1]]
<CKAN Resource> 97622ce6-c06a-4970-afe5-be540c748f24 
  Name: Vital events data by month

res <-resource_show(id ="97622ce6-c06a-4970-afe5-be540c748f24")
res$url
destfile <- "vital_events_data_by_month_1994-2021_q2.csv"
curl::curl_download(res$url, destfile)


[[8]]
<CKAN Resource> ed270bb8-340b-41f9-a7c6-e8ef587e6d11 
  Name: Status of COVID-19 cases in Ontario
  Description: Compiled daily reported data on COVID-19 testing and outcomes in Ontario. Blank cells represent values that were not reported.

As of November 12, 2021, routine Variants of Concern (VOC) PCR testing of positive COVID-19 samples is no longer being conducted. All eligible positive COVID-19 samples will now be forwarded for whole genome sequencing.  Starting on November 16, 2021, VOC data will not be reported in Status of COVID-19 cases in Ontario.
Data on VOC can be found on Public Health Ontario's [COVID-19 Variants of Concern (VOCs)](https://www.publichealthontario.ca/en/diseases-and-conditions/infectious-diseases/respiratory-diseases/novel-coronavirus/variants). Historical data on VOCs and mutations in daily and weekly epidemiological summaries can be found on [COVID-19: Epidemiologic summaries from Public Health Ontario](https://covid-19.ontario.ca/covid-19-epidemiologic-summaries-public-health-ontario)
  

[[10]]
<CKAN Resource> 455fd63b-603d-4608-8216-7d8647f43350 
  Name: Confirmed positive cases of COVID19 in Ontario
  Description: Compiled daily reported data from public health units on confirmed positive cases of COVID-19 in Ontario. 
  
[[11]]
<CKAN Resource> 775ca815-5028-4e9b-9dd4-6975ff1be021 
  Name: COVID-19 Vaccine data by age
  Description: As of December 1, 2021, the population counts are based on Statistics Canada's 2020 estimates.
  
 

-->


