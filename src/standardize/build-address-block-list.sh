rm -f data/tempstash/address-block-list.txt
time find data/stashed/socrata-chicago-crime-incidents/ \
    -name '*.csv' -exec xsv select 4 {} \; \
        >> data/tempstash/address-block-list.txt


cat data/tempstash/address-block-list.txt \
    | sort | uniq -c \
    | rg -o '^ *(\d+)\s+(.+)' -r '$1,$2'\
    > data/tempstash/address-block-list-sorted.csv
