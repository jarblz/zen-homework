require 'json'
class Organization
  SEARCH_TERMS = {"1" => "name", "2" => "_id"}
  TERM_TYPES = {"1" => "fuzzy_search", "2" => "exact"}
  RELATED_OBJECTS = {}
  # when inlining into a related object, these are the fields that will display
  SUMMARY_FIELDS = {"Organization Name" => "name"}

  def initialize(*args)
  end

  def search_terms
    self.class::SEARCH_TERMS
  end

  def self.file_name
    '../data/organizations.json'
  end

end
