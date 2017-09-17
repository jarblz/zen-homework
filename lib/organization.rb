require 'json'
class Organization
  SEARCH_TERMS = {"1" => "name", "2" => "_id"}
  TERM_TYPES = {"1" => "fuzzy_search", "2" => "exact"}
  RELATED_OBJECTS = {}
  def initialize(*args)
    puts "New #{self.class.name}"
  end

  def search_terms
    self.class::SEARCH_TERMS
  end

  def self.file_name
    '../data/organizations.json'
  end

end
