require 'json'

class User
  SEARCH_TERMS = {"1" => "name", "2" => "id"}
  TERM_TYPES = {"1" => "fuzzy_search", "2" => "exact"}
  # when inlining into a related object, these are the fields that will display
  SUMMARY_FIELDS = {"User Name" => "name"}
  RELATED_OBJECTS = {"Organization": "organization_id"}

  def initialize(*args)
  end

  def search_terms
    self.class::SEARCH_TERMS
  end

  def self.file_name
    '../data/users.json'
  end


end
