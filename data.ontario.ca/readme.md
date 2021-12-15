Open Ontario Databases provides API which can be used to find and access data as shown below.
See  [L&L in June dedicated to CKAN](https://github.com/open-canada/lunch_and_learn_opengov/). 


```{r eval=FALSE, include=FALSE, echo=T}

library(ckanr)
library(data.table) 

ckanr_setup(url = "https://data.ontario.ca/")
resource_search(q = "name:Vaccin")$results

res <-resource_show(id ="274b819c-5d69-4539-a4db-f2950794138c")
res$url
destfile <- "Hospitalizations by vaccination status.csv"
curl::curl_download(res$url, destfile)

```

This folder provides cached copies of some of Open Ontario Databases - for easier use and practicing while leaning R and building tools to visualize those data
