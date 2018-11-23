


# Getting all the address/blocks into a file to test out regexes


Code is in [src/standardize/build-address-block-list.sh](src/standardize/build-address-block-list.sh).

Interesting takeaways:

- `xsv` is **fast**
- every block number is 0-padded to 5 characters, e.g. `007XX`
- 6,525 instances of just `Block`
- Only 2 instances of `XX  UNKNOWN`
- About 16,000 blank address fields: 
    
        ```
        rg '^\s*$' data/tempstash/address-block-list.txt | wc -l
        ```
