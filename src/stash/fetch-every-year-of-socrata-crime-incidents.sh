#!/bin/sh

TEMP_DIR=data/tempstash/crime-incident-years
SLUG_FILE=data/lookups/socrata-crime-incident-years.csv
mkdir -p ${TEMP_DIR}

sed '1d' ${SLUG_FILE} \
    | while read -r line; do
    year=$(echo $line | cut -d, -f1)
    slug=$(echo  $line | cut -d, -f2)
    url="https://data.cityofchicago.org/api/views/${slug}/rows.csv?accessType=DOWNLOAD"
    fname=${TEMP_DIR}/${year}.csv
    echo $fname: $url

    curl -L -o $fname $url
done

