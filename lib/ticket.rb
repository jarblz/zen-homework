require 'json'

class Ticket
  SEARCH_TERMS = {"1" => "subject", "2" => "type"}
  TERM_TYPES = {"1" => "fuzzy_search", "2" => "exact"}
  RELATED_OBJECTS = {"Organization": "organization_id", "User": "assignee_id"}
  def initialize(*args)
    puts "New #{self.class.name}"
  end

  def search_terms
    self.class::SEARCH_TERMS
  end

  def self.file_name
    '../data/tickets.json'
  end

end
