# Chicago Crime Data -- datastore repo

A repo containing the ETL scripts and their results for Chicago crime data.



```sh

# script that converts the tempstash/year files into
# individual day files, more optimal for git tracking and so forth!
$ python src/stash/split-socrata-years-into-days.py \
    data/tempstash/crime-incident-years \
    data/stashed/socrata-chicago-crime-incidents
```


# Contact card data


Official:

https://home.chicagopolice.org/isr-data/

Lucy Parsons Lab

- https://www.citylab.com/equity/2018/06/where-chicagoans-are-being-stopped-and-frisked/562160/
- https://lucyparsonslabs.com/posts/stop-and-frisk/
- https://www.dropbox.com/sh/lq4uvm5bb2ikur7/AAB4AuGpbTvHFcMP8xq4rfsJa?dl=0

