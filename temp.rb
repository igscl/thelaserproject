require 'json'
data_read = File.read ('./data/data.json')
hash = JSON.parse(data_read)
print hash