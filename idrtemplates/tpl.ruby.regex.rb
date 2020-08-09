# either match or scan
text = "A regular expression is a sequence of characters that define a search pattern."

# match
puts text.match(/character/)
# scan
puts text.scan(/\b[aeiou][a-z]*\b/)
