text = "A regular expression is a sequence of characters that define a search pattern."
matches = text.match(/character/)
puts matches
puts text.scan(/\b[aeiou][a-z]*\b/)
