


# Getting all the address/blocks into a file to test out regexes


Code is in [src/standardize/build-address-block-list.sh](src/standardize/build-address-block-list.sh).

Interesting takeaways:

- `xsv` is **fast**
- every block number is 0-padded to 5 characters, e.g. `007XX` and `0000X`
- 6,525 instances of just `Block`
- Only 2 instances of `XX  UNKNOWN`
- About 16,000 blank address fields 
    
        ```
        rg '^\s*$' data/tempstash/address-block-list.txt | wc -l
        ```

- Some street names in lowercase: 0000X W Washington St
0000X W hubbard st
- Only 4 addresses (And 2 unknowns) fail to fit the following pattern:

    (?P<block_number>\d+XX) (?P<direction>\b[NSEW]\b) (?P<street_name>.+?)

    008XX  LEXINGTON CIRCLE
    059XX  BETTY GLOYD DRIVE
    072XX  PARK AVE
    173XX  LORENZ
    Block
    XX  UNKNOWN

- About 60 addresses have internal consecutive whitespace, e.g.

    071XX S  KOSTNER AV
    071XX S MARSHFIELD  AVE
    072XX  PARK AVE

