require 'pry-byebug'
# require './word_count/word_count'

# Ruby code for Stripes method reduce.rb
#

#
#Test code locally
# f = File.open("/Users/dan_mi_sun/projects/bbk_actmasters_14-15/cloudcomputing_BBK_BUCI029H7_1415/question_1/output.txt", "r")

#create data structure within which to do internal corresponding value addition
#
merging_container = {}

# f.each_line do |line|
#Read in each line of text.
ARGF.each do |line|

  # remove any newline
  line = line.chomp
  # puts "this is the line: #{line}"

  # split key and value on tab character
  (key, value) = line.split(/\t/)

  # puts "This is key #{key}"
  # puts "This is value #{value}"

  #remove non-alphanumeric chars from value string and turn into array
  a = value.gsub!(/[^0-9a-z ]/i, ' ').split(' ')

  #turn values array into a hash of key value pairs
  h = Hash[a.each_slice(2).to_a]

  #if the key already exists then append
  #
  if merging_container.has_key?(key)
    # puts "HELLO"
    # puts "this is the key: #{key}"

    #set top level key for use within inner hash loop
    _key = key

    #look to see if the h contains an existing inner key with an additional value 
    #
    h.each do |key, value|
      # puts "WHY HELLO"
      # puts "this is the key:#{key}"
      # puts "this is the _key:#{_key}"
      # puts "this is the value:#{value}"

      if merging_container[_key].has_key?(key)
        # puts "WHY WHY HELLO"
        #if key exists in inner hash then add the value to the existing entry within the merging container
        merging_container[_key][key] =  merging_container[_key].values.first.to_i + value.to_i
        # puts "This is merging container #{merging_container}"
        # puts "#{'-' *30}"

      else

      end
    end

  else
    #if the key does not already exist then make new entry
    #add key and values to merging container
    #
    # puts "HELLO ELSE"
    # puts "This is h #{h}"

    #set top level key for use within inner hash loop
    _key = key

    #add key value pairs to data structure
    h.each do |key, value|
      # puts "WHY HELLO"
      # puts "this is the key:#{key}"
      # puts "this is the _key:#{_key}"
      # puts "this is the value:#{value}"
      #add top level key to merging container
      #
      merging_container[_key] ||= {}
      # merging_container[_key] = Hash.new { |k, v| k[v] = {} }
      # if merging_container[_key].nil? ? (Hash.new { |k, v| k[v] = {} }) : merging_container[_key].merge!(key => value) end

      #add inner key and value to top level key
      #
      merging_container[_key].merge!(key => value)
      # merging_container[_key][key] = value

      # puts "This is merging container #{merging_container}"
      # puts "#{'-' *30}"
    end
  end
end

#calculate the conditional probability that a word w′ occurs immediately after another word w, i.e.,
#Pr[w′|w] = count(w, w′)/count(w)
#for each two-word-sequence (w,w′)

#find total # of times w appears
#need to climb through hash map and find all occurences
#data structure for counting total number of w
# w_count = {}
# puts "this is the MC: #{merging_container}"
merging_container.each do |key, value|
  # if key == "1500"
  # puts "#{key} is followed by:"
  _key = key
  value.each do |k, v|
    puts _key + "\t" + k + "\t" + v.to_s
  end
  # else
  #   break
  # end
end
#
# f = File.open("/Users/dan_mi_sun/projects/bbk_actmasters_14-15/cloudcomputing_BBK_BUCI029H7_1415/question_1/test-txt-files/reduce-input-sorted.txt", "r")
#   f.each_line do |line|
#   phrase = Phrase.new(line)
#   puts "this is p_wc: #{phrase.word_count}"
#   end
# end

#find the top key which matches w
#find all the values for occurances AFTER w
#recurse through inner hash map and output value and their total number
# then calculate count(w, w')/count(w)
