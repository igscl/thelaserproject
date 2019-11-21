# Development log
## 15/11/2019

I realised adding the data in the same index.rb ruby file was messy and not reliable. Opted for using a separate JSON file in which all the data is located. Made an excel spreadsheet and then exported to JSON file using an online tool that became very handy. I had 49 types of data, the equivalent of 49 clients with lots of data inside. I actually have more data in the JSON file than I need to, which makes upgrades of the app easy. Data pulling works seamesly and did error and reliability checking. So far no issues.

## 16/11/2019

Was contemplating adding sound effects from the beginning, it's making the app fun. Adding animations and sounds to go with it. Using `afplay which will only work in Mac. Was looking into different Gems but non of them were reliable or added too many lines of code. This is the best option I could find. Working through all the loops and not causing any errors. Also added some easter eggs and chose to do animations and sound effects. This is done by reading a special input on the ARGV file. Asigned the ARGV to variable "secret". So far no errors and it's working fine.