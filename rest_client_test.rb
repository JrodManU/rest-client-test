require 'rest-client'

raw = RestClient.get('https://bing.com', {params: {q: 'my buddy'}}).body

results = []

raw.gsub(/(?i)<ol id="b_results"([^>?]+)>(.+?)<\/ol>/) do |ol|
  ol.gsub(/(?i)<a([^>?]+)>(.+?)<\/a>/) do |a|
    a.gsub(/(http:\/\/|https:\/\/).*?"/) do |link|
      results << link[0, link.length - 1]
    end
  end
end
puts 'These are the best results I could filter:'
puts ''
puts results
