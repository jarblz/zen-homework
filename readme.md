## Synopsis

This is a simple JSON search engine that searches from three different JSON files
- `./data/organizations.json`
- `./data/tickets.json`
- `./data/users.json`

## Features/Usage

Command line interface for this search can be run by executing the **production.rb** file in the top directory.  (e.g. `ruby production.rb`)

- you can search any of the three objects
- two choices for each object

## Features that were left out (for now)

  - Full data model mapping between users and tickets, users and organizations, and organizations and tickets
  - Nested searching (e.g. being able to search all tickets for a given user)
  - map datatypes to the different fields so that we can allow users to search any field rather than the two that I've manually provided

## Installation

Clone the repo, run the scripts listed above

## Tests

Tests are run by executing the **test.sh** bash script

e.g. `bash test.sh`
