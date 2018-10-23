require 'pry'
require "yaml"

def load_library(file)
  file = YAML.load_file(file)
  emoticon_hash = Hash.new
  emoticon_hash['get_meaning'] = {}
  emoticon_hash['get_emoticon'] = {}

  file.each do |key, value| 
    emoticon_hash['get_meaning'][value[1]] = key
    
    emoticon_hash['get_emoticon'][value[0]] = value[1]
  end 

  emoticon_hash

end

def get_japanese_emoticon(file, emoticon)
  japanese_emoticon = load_library(file)['get_emoticon'][emoticon] 
  
  japanese_emoticon ? japanese_emoticon : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  english_meaning = load_library(file)['get_meaning'][emoticon] 

  english_meaning ? english_meaning : "Sorry, that emoticon was not found"
end