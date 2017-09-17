## Synopsis

This is a simple JSON search engine that searches from three different JSON files
- `./data/organizations.json`
- `./data/tickets.json`
- `./data/users.json`

## Features/Usage

Command line interface for this search can be run by executing the **production.rb** file in the **executables** directory.  e.g. `bash ./executables/search.sh`

- you can search any of the three objects
- two choices for each object

## Features that were left out (for now)

  - Full data model mapping between users and tickets, users and organizations, and organizations and tickets
  - Nested searching (e.g. being able to search all tickets for a given user)
  - map datatypes to the different fields so that we can allow users to search any field rather than the two that I've manually provided

## Installation

Clone the repo, run the scripts listed above

## Tests

Tests are run by executing the **test.sh** bash script in the executables directory

e.g. `bash ./executables/test_search.sh`

**A Quick Note on My Testing Method:**
- It is unconventional because I didn't see a clear path forward implementing RSpec to test a single ruby script outside the context of a rails app.
- see the comments in the **test_search.sh** for more info
- I estimate test coverage very high. (>90%). That being said, I would try and convert all these tests into RSpec if this was a script in a conventional rails app.
