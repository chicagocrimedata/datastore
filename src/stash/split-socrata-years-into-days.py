from csv import DictReader, DictWriter
from collections import defaultdict
from datetime import datetime as dt
from pathlib import Path
import re
from sys import argv, stderr

OUT_HEADERS = [
'ID',
'Case Number',
'Date',
'Block',
'IUCR',
'Primary Type',
'Description',
'Location Description',
'Arrest',
'Domestic',
'Beat',
'District',
'Ward',
'Community Area',
'FBI Code',
'X Coordinate',
'Y Coordinate',
'Updated On',
'Latitude',
'Longitude',
]


if __name__ == '__main__':
    SRC_DIR, DEST_DIR = [Path(a) for a in argv[1:]]
    stderr.write("Source data directory is: %s\n" % SRC_DIR)
    stderr.write("Destination data directory is: %s\n" % DEST_DIR)

    src_filenames = sorted(SRC_DIR.glob('*.csv'))
    stderr.write("Found %s CSV files in %s:\n" % (len(src_filenames), SRC_DIR))

    for fn in src_filenames:
        stderr.write("- Processing: %s\n" % fn)
        the_year = re.search(r'\d{4}(?=\.csv)', str(fn))[0]

        records_by_day = defaultdict(list)
        rcount = 0
        with open(fn) as src:
            for row in DictReader(src):
                # we don't need "Location" as it is redundant with Latitude, Longitude
                row.pop('Location')
                row.pop('Year')
                isodate = dt.strptime(row['Date'][:10], '%m/%d/%Y').strftime('%Y-%m-%d')
                records_by_day[isodate].append(row)
                rcount += 1

        _stat = "\t{n} day groupings of {k} records found for {yr}\n".format(n=len(records_by_day.keys()),
                                                                             yr=the_year, k=rcount)
        stderr.write(_stat)
        # now we iterate through records_by_day and create a new file for each key i.e. day
        for day, records in records_by_day.items():
            dest_fn = DEST_DIR.joinpath(the_year, day + '.csv')
            # make year sub directory
            dest_fn.parent.mkdir(parents=True, exist_ok=True)
#            stderr.write("\t{d}: {n} records\n".format(d=dest_fn, n=len(records)))

            with open(dest_fn, 'w') as dfn:
                dest = DictWriter(dfn, fieldnames=OUT_HEADERS)
                dest.writeheader()
                dest.writerows(records)
