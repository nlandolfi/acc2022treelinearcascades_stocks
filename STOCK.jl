module STOCK

import DataFrames
import CSV

# note: excludes "dow" since the corporate entity is < 2 yrs old
# all other stocks have the full 10 years worth of data.
tickers = ["mmm", "axp", "amgn", "aapl", "ba", "cat", "cvx", "csco", "ko", "gs", "hd", "hon", "ibm", "intc", "jnj", "jpm", "mcd", "mrk", "msft", "nke", "pg", "crm", "trv", "unh", "vz", "v", "wba", "wmt", "dis"]
names = ["3M", "American Express", "Amgen", "Apple", "Boeing", "Caterpillar", "Chevron", "Cisco", "Coca-Cola", "Goldman Sachs", "Home Depot", "Honeywell", "IBM", "Intel", "Johnson & Johnson", "JP Morgan Chase", "McDonald's", "Merck", "Microsoft", "Nike", "Procter & Gamble", "Salesforce", "Travelers", "UnitedHealth", "Verizon", "Visa", "Walgreens Boots Alliance", "Walmart", "Walt Disney Company"]
sectors = ["Diversified Holding Companies", "Banking", "Biotechnology", "Computers/Consumer Electronics", "Aerospace Products/Parts", "Mobile Machinery", "Major Oil & Gas", "Networking", "Non-Alcoholic Beverages/Drinks", "Chemicals", "Securities", "Home Goods Retail", "Diversified Holding Companies", "Computer Services", "Semiconductors", "Pharmaceuticals", "Major International Banks", "Restaurants", "Pharmaceuticals", "Software", "Footwear", "Personal Care Products/Appliances", "Software", "Non-Life Insurance", "Life Insurance", "Wireless Telecommunications Services", "Consumer Finance","Drug Retail", "Mixed Retailing", "Broadcasting"]
industries = ["Business/Consumer Services", "Financial Services", "Health Care/Life Sciences", "Technology", "Industrial Goods", "Industrial Goods", "Companies on the Energy Service", "Technology", "Consumer Goods", "Financial Services", "Retail/Wholesale", "Business/Consumer Services", "Business/Consumer Services", "Technology", "Health Care/Life Sciences", "Financial Services", "Leisure/Arts/Hospitality", "Health Care/Life Sciences", "Technology", "Consumer Goods", "Consumer Goods", "Technology", "Financial Services", "Financial Services", "Telecommunication Services", "Financial Services", "Retail/Wholesale", "Retail/Wholesale", "Media/Entertainment"]
colors = Dict(
  "Technology" => "gray",
  "Financial Services" => "aqua",
  "Business/Consumer Services" => "orange",
  "Health Care/Life Sciences" => "red",
  "Industrial Goods" => "fuchsia",
  "Companies on the Energy Service" => "hotpink",
  "Consumer Goods" => "darksalmon",
  "Basic Materials/Resources" => "magenta",
  "Retail/Wholesale" => "darkgoldenrod2",
  "Leisure/Arts/Hospitality" => "yellow",
  "Telecommunication Services" => "lavenderblush",
  "Media/Entertainment" => "seagreen2",
)
frames = []

for ticker in tickers
  global frames
  # println("loading $ticker")
  df = DataFrames.DataFrame(CSV.File("data/$ticker.csv"))
  push!(frames, df)
end

backto = size(frames[1], 1)
Opens = zeros(backto, size(tickers, 1))
Closes = zeros(backto, size(tickers, 1))
Volumes = zeros(backto, size(tickers, 1))

for j in 1:size(tickers, 1)
  # println("getting open price $(tickers[j]) index $j")
  Opens[:, j] = frames[j][1:backto, 2]
  Closes[:, j] = frames[j][1:backto, 5]
  Volumes[:, j] = frames[j][1:backto, 6]
end

end
