#!/usr/bin/env ruby
# Dropbox Challenge: The Dropbox Diet
# (see http://www.dropbox.com/jobs/challenges)
#
# This implementation will find a solution of the smallest number of items
# available, but the specific solution found is not guaranteed to be any
# particular solution.  It will find the last generated combination from
# the Array#combination method that satisfies the zero-sum requirement

# Tested on:
#   Operating Systems
#     OS X only
#   Ruby Interpreters
#     ruby 1.8.7p249
#     ruby 1.9.2p290
#     rubinius 2.0.0dev e3a8a1ca
#     jruby 1.6.4

# read in the number of activities
num_activities = gets.chomp.to_i

activities = {}

# Read in the activities, checking them a little
num_activities.times do 
  activity, calories = gets.chomp.split
  
  # Check the formatting...
  unless activity =~ /[a-z-]*/
    puts "Incorrect format for activity name"
    exit 1
  end
  
  # Check the calorie impact is a valid integer
  unless calories =~ /-?[0-9]*/
    puts "Calorie impact must be a number"
    exit 1
  end
  
  activities[calories.to_i] = activity
end

match = no_solution = false
num_of_activities = 2

# Check items, starting at small combinations, for a zero-sum combination
until match || no_solution
  combos = activities.keys.combination(num_of_activities).to_a
  
  # Check for running past the length of the array
  if combos.size == 0
    no_solution = true
  end
  
  # Check each combination for a match
  combos.each do |combination|
    # Sum the values in this combination
    sum = combination.reduce(0) { |total, value| total + value }
    
    if sum == 0
      match = combination
    end
  end
  
  # Increment the number of activities per combination
  num_of_activities += 1
end

# Display findings
if match
  # Get activity names back and sort them alphabetically
  activites = match.map { |calories| activities[calories] }.sort.each do |activity|
    puts activity
  end
else
  # No solution was found
  puts 'no solution'
end