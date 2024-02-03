#!/usr/bin/env ruby

# Filename: match_school.rb

# Method to check if the argument matches the regular expression for "School"
def match_school(argument)
  regex = /\bSchool\b/i  # Case-insensitive whole word match for "School"
  if argument.match?(regex)
    puts "#{argument}"
  else
    puts "The argument '#{argument}' does not match the pattern 'School'."
  end
end

# Check if an argument is provided
if ARGV.empty?
  puts "Please provide an argument."
else
  # Get the first command-line argument
  input_argument = ARGV[0]

  # Call the method to match against the regular expression
  match_school(input_argument)
end

