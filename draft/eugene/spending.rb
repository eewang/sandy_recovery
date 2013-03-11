require 'nokogiri'
require 'open-uri'
require 'pry'

source = "http://www.usaspending.gov/fpds/fpds.php?state=IL&detail=b"

@doc = Nokogiri::XML(open(source))

all_contracts = @doc.children[0].children[3].children

contracts = @doc.children[0].children[3].children[1].children

hash = {}

contracts.each do |item|
  if contracts.index(item) % 2 != 0
    begin
      hash[item.name.to_sym] = item.text
    rescue => ex
      puts ex
    end
  end
end

binding.pry
