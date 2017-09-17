class Messages
  def self.welcome_greeting(order)
    puts 'Please Choose an object to search:'
    puts '0: exit'
    order.each do |k,v|
      puts "#{k}: #{v}"
    end
  end

  def self.incorrect_search_type
    puts 'Sorry! That is not a valid search_type, please enter a number:'
  end

  def self.invalid_search_term
    puts 'Sorry! That is not a valid selection, please enter a number:'
  end

  def self.object_search_message(object)
    puts "Lets find the #{object.class.name}(s) your looking for."
    puts "Please choose a field from which to search:"
    puts "0: Go back"
    object.search_terms.each do |k,v|
      puts "#{k}: #{v}"
    end
  end

  def self.search_by_term(search_term, object_name)
    puts "Enter a search term for #{search_term} in #{object_name}, or '0' to go back"
  end

  def self.search_again?
    puts "Would you like to search again?"
  end

  def self.search_result_divider(object, count)
    puts "**********************|Matching #{object.class.name}s - (#{count})|**************************"
  end

  def self.no_search_result
    puts "No entries were found for that term!"
  end
end
