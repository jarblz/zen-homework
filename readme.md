## Synopsis

This is a simple JSON search engine that searches from three different JSON files
- `./data/organizations.json`
- `./data/tickets.json`
- `./data/users.json`

## Features/Usage

Command line interface for this search can be run by executing the **production.rb** file in the **executables** directory.  
- e.g. `cd executables`
- `bash search.sh`
- you can search any of the three objects
- two choices for each object

## Tests

Tests are run by executing the **test.sh** bash script in the executables directory

- e.g. `cd executables`
- `bash test_search.sh`

**A Quick Note on My Testing Method:**
- It is unconventional because I didn't see a clear path forward implementing RSpec to test a single ruby script outside the context of a rails app.
- see the comments in the **test_search.sh** for more info
- I estimate test coverage very high. (>90%). That being said, I would try and convert all these tests into RSpec if this was a script in a conventional rails app.


## Installation

Clone the repo, run the scripts listed above

## Features that were left out (for now)

  - Full data model mapping between users and tickets, users and organizations, and organizations and tickets
  - Nested searching (e.g. being able to search all tickets for a given user)
  - map datatypes to the different fields so that we can allow users to search any field:
    - I know this didn't quite match spec that was provided in the assignment, but I decided it would be better to build in the mapping for only 2 fields per object, and have the infrastructure to map each field to a datatype that will allow us to accurately search once all the mappings are built.



##Shortcomings
- The main thing that I wish I had done better, would be that the classes contained `organization.rb`, `ticket.rb`, and `user.rb` are underutilized.  
- There are no instance methods in these classes so they essentially just accomplish the task of storing immutable parameters specific to each class that inform some of the search behavior.
- I would have liked to create instance and class methods similar to how activerecord works for these classes.  However most of this functionality found its way into `search.rb` as I was taking care to keep the code DRY.
