require 'json'
class Search
  # this class contains all search functionality dictated by the object and term passed in
  attr_accessor :object
  attr_accessor :term_id
  attr_accessor :env
  attr_accessor :id

  def initialize(object, term_id, environment, id=nil)
    @object, @term_id, @env, @id = object, term_id, environment, id
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

  def related_fields_hash
    json = JSON.parse(File.open(object.class.file_name).read)
    related_fields(find(json, id))
  end

  def related_fields(related_object)
    result = {}
    if related_object.empty?
      result["Related #{self.object.class}"] = "None"
    else
      object.class::SUMMARY_FIELDS.keys.each do |k|
        result[k] = related_object.first[object.class::SUMMARY_FIELDS[k]]
      end
    end
    return result
  end

  def search_field
    object.search_terms[term_id]
  end

  def term_type
    object.class::TERM_TYPES[term_id]
  end

  def with_related_fields(item)
    # and complexity for now.  The mapping stored in each object (RELATED_FIELDS),
    # needs more work than I'm willing to put in at this point.  Better to limit
    # the scope initially and build on to it later
    if object.class::RELATED_OBJECTS
      item["= + = + = + = + = Related Objects Section"] = " = + = + = + = + ="
      object.class::RELATED_OBJECTS.each do |k,v|
        Search.new(Object.const_get(k).new(), nil, self.env, item[v])
        .related_fields_hash.each do |field_name, field_value|
            item[field_name] = field_value
          end
      end
    end
    return item
  end

  def fuzzy_search(json, search_term)
    result = []
    json.each do |item|
      next unless item[search_field].to_s.downcase.include? search_term.to_s.downcase
      result << with_related_fields(item)
    end
    return result
  end

  def exact_search(json, search_term)
    result = []
    json.each do |item|
      if item[search_field].to_s == search_term.to_s
        result << with_related_fields(item)
      end
    end
    return result
  end

  def find(json, id)
    json.select {|item| item["_id"].to_s == id.to_s}
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
