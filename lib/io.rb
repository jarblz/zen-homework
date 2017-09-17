require_relative 'search'
require_relative 'messages'
require_relative 'user'
require_relative 'organization'
require_relative 'ticket'
class Interface
  SEARCH_TYPE_ORDER = {"1" => 'Organization', "2" => 'Ticket', "3" => 'User'}

  attr_accessor :env
  def initialize(environment)
    @env = environment
  end

  def main_loop
    Messages::welcome_greeting(SEARCH_TYPE_ORDER)
    search_type = input_based_on_environment
    if search_type == "0"
      return
    elsif !SEARCH_TYPE_ORDER.keys.include? search_type
      puts Messages::incorrect_search_type
      main_loop
    else
      search_loop(Object::const_get(SEARCH_TYPE_ORDER[search_type]).new())
    end
  end

  def search_loop(object)
    Messages::object_search_message(object)
    search_term = input_based_on_environment
    if search_term == "0"
      main_loop
    elsif !object.search_terms.keys.include? search_term
      Messages::invalid_search_term
      search_loop(object)
    else
      Search.new(object, search_term, env).by_term
      search_loop(object)
    end
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
