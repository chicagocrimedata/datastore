mkdir -p data/tempstash/cpd-contact-cards

unzip -p data/stashed/cpd-contact-cards/29-FEB-2017\ thru\ 16-JAN-2018\ -\ ISR\ -\ JUV\ Redacted.csv.zip \
    > data/tempstash/cpd-contact-cards/2017.csv

unzip -p \
    data/stashed/cpd-contact-cards/01-JAN-2016\ to\ 28-FEB-2017\ -\ ISR\ -\ JUV\ Redacted.csv.zip \
    > data/tempstash/cpd-contact-cards/2016.csv

unzip -p data/stashed/cpd-contact-cards/ContactCardData2015.csv.zip \
    > data/tempstash/cpd-contact-cards/2015.csv

unzip -p data/stashed/cpd-contact-cards/ContactCardData2014.csv.zip \
    > data/tempstash/cpd-contact-cards/2014.csv

unzip -p data/stashed/cpd-contact-cards/ContactCardData2013.xlsx.zip \
    > data/tempstash/cpd-contact-cards/2013.xlsx

in2csv --skip-lines 3 --no-inference --sheet 'Export Worksheet' \
    data/tempstash/cpd-contact-cards/2013.xlsx \
    > data/tempstash/cpd-contact-cards/2013.csv


unzip -p data/stashed/cpd-contact-cards/ContactCardData2012.xlsx.zip \
    > data/tempstash/cpd-contact-cards/2012.xlsx

in2csv --skip-lines 3 --no-inference --sheet 'Export Worksheet' \
    data/tempstash/cpd-contact-cards/2012.xlsx \
    > data/tempstash/cpd-contact-cards/2012.csv



