require 'json'
class Search
  # this class contains all search functionality dictated by the object and term passed in
  attr_accessor :object
  attr_accessor :term_id
  attr_accessor :env

  def initialize(object, term_id, environment)
    @object, @term_id, @env = object, term_id, environment
  end

  def by_term
    Messages::search_by_term(search_field, object.class.name)
    search_term = input_based_on_environment
    return unless search_term != "0"
    json = JSON.parse(File.open(object.class.file_name).read)
    # the TERM_TYPES hash is meant to help us define custom search functionality
    # on a term by term basis. for now there are only two term types, word_search, and exact
    # alternatively, we could ask the user to specify the type of search if there was more time
    if term_type == "fuzzy_search"
      puts human_readable(fuzzy_search(json, search_term))
    else
      puts human_readable(exact_search(json, search_term))
    end
    by_term
  end

  def search_field
    object.search_terms[term_id]
  end

  def term_type
    object.class::TERM_TYPES[term_id]
  end

  def with_related_fields(item)
    # I didn't feel like getting into this functionality was worth the time
    # and complexity for now.  The mapping stored in each object (RELATED_FIELDS),
    # needs more work than I'm willing to put in at this point.  Better to limit
    # the scope initially and build on to it later
    return item
  end

  def fuzzy_search(json, search_term)
    result = []
    json.select do |item|
      next unless item[search_field].downcase.include? search_term
      result << with_related_fields(item)
    end
    return result
  end

  def exact_search(json, search_term)
    result = []
    json.select do |item|
      next unless item[search_field] == search_term
      result << with_related_fields(item)
    end
    return result
  end

  def human_readable(result_set)
    Messages::search_result_divider(object, result_set.length)
    if result_set.length != 0
      result_set.each do |item|
        puts "---|#{item.keys.first}: #{item[item.keys.first]}|---"
        item.each do |k,v|
          next unless k != item.keys.first
          puts "| #{k}: #{v}"
        end
      end
    else
      Messages::no_search_result
    end
    Messages::search_result_divider(object, result_set.length)
  end

  def input_based_on_environment
    # for testing purposes, we want to be able to call our main loop with passed arguments
    if env == "test"
      ARGV.shift
    else
      gets.strip
    end
  end

end
