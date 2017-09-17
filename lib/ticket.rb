require 'json'

class Ticket
  SEARCH_TERMS = {"1" => "subject", "2" => "type"}
  TERM_TYPES = {"1" => "fuzzy_search", "2" => "exact"}
  RELATED_OBJECTS = {"Organization" => "organization_id", "User" => "assignee_id"}
  # when inlining into a related object, these are the fields that will display
  SUMMARY_FIELDS = {"Ticket Name" => "subject", "Ticket Priority" => "priority"}
  def initialize(*args)
  end

  def search_terms
    self.class::SEARCH_TERMS
  end

  def self.file_name
    '../data/tickets.json'
  end

end
