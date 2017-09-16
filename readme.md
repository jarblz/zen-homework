## Synopsis

This is a simple JSON search engine that searches from three different JSON files
- `./data/organizations.json`
- `./data/tickets.json`
- `./data/users.json`

## Features/Usage

Command line interface for this search can be run by executing the **production.rb** file in the top directory.  
 - 2 choices for search for each of the three objects

## Features that were left out (for now)

  - Full data model mapping between users and tickets, users and organizations, and organizations and tickets
  - Nested searching (e.g. being able to search all tickets for a given user)

## Installation

Clone the repo, run the scripts listed above

## Tests

Tests are run by executing the **test.sh** bash script

e.g. `bash test.sh`
