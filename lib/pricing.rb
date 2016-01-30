module Pricing
  require 'rss'
  require 'nokogiri'
  require 'open-uri'

  def self.pricing_calc policy, base_price
    total_price = 0
    case policy

    when "Prestige"
      rss = RSS::Parser.parse('http://www.yourlocalguardian.co.uk/sport/rugby/rss/', false)
      pub_counter = 0
      rss.items.each do |pcount|
        pub_counter += 1 if item.respond_to? "pubDate"
      end
        margin = pub_counter + base_price

    when "Flexible"
      page = Nokogiri::HTML(open('http://reuters.com'))
      a_count = page.text.count('a')/100.to_f
      total_price = a_count * base_price.to_i

    when "Fixed"
      page = Nokogiri::HTML(open('https://developer.github.com/v3/#http-redirects'))
      s_count = page.text.scan(/\w+/).count("status")
      total_price = s_count + base_price.to_i

    end
    total_price
  end
end
