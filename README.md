# Chicago Crime Data -- datastore repo

A repo containing the ETL scripts and their results for Chicago crime data.



```sh

# script that converts the tempstash/year files into
# individual day files, more optimal for git tracking and so forth!
$ python src/preload/split-socrata-years-into-days.py \
    data/tempstash/crime-incident-years \
    data/fetched/socrata-chicago-crime-incidents
```
