require 'nokogiri'
require 'open-uri'
require 'pry'

source = "http://www.usaspending.gov/fpds/fpds.php?state=NY&detail=b&fiscal_year=2013&max_records=10&records_from=0"

@doc = Nokogiri::XML(open(source))

# all_contracts = @doc.children[0].children[3].children

contracts = @doc.children[0].children[3].children # => every odd has data

hash = {}
binding.pry
contracts.each do |set|
  if contracts.index(set) % 2 != 0
    set.children.each do |item|
      binding.pry
      if set.children.index(item) % 2 != 0
        begin
          hash[("key_" + contracts.index(set).to_s).to_sym] ||= {}
          hash[("key_" + contracts.index(set).to_s).to_sym][item.name.to_sym] ||= item.text
        rescue => ex
          puts ex
        end
        sleep 1
      end
    end
  end
end

binding.pry