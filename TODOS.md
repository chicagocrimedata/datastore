# TODOS



# Makefile

- [ ] Make a Makefile!
- [ ] Make a task that pre-stashes and day-splits a year's worth of Socrata data

## src

### stash

- [stash/split-socrata-years-into-days.py](stash/split-socrata-years-into-days.py)
    - [ ] Use named arguments
    - [ ] Throw error when both indir and outdir not provided
    - [ ] Functionalize!


### standardize

- [ ] parse_address_block: convert `114XX S ST LAWRENCE AVE` to a dict:

    - `address_number`: 114XX
    - `street_direction`: S
    - `street_name`: `ST LAWRENCE AVE`

- [ ] iso date: convert `01/01/2001 04:05:00 PM` to: `2001-01-01 16:05`


### filter


### wrangle
