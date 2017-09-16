require 'json'

class User
  SEARCH_TERMS = {"1" => "name", "2" => "id"}
  TERM_TYPES = {"1" => "fuzzy_search", "2" => "exact"}

  RELATED_OBJECTS = {"Organization": "organization_id"}
  def initialize(*args)
    puts "New #{self.class.name}"
  end

  def search_terms
    self.class::SEARCH_TERMS
  end

  def self.file_name
    './data/users.json'
  end


end
