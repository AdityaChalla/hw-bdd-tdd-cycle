# Add a declarative step here for populating the DB with movies.

Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
end


Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  assert page.body =~ /#{e1}.+#{e2}/m
  #  ensure that that e1 occurs before e2.
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  #fail "Unimplemented"
  rating_list.split(',').each do |rating|
    if uncheck
      uncheck "ratings_#{rating}"
    else
      check "ratings_#{rating}"
    end
  end
end

# Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
#   assert page.body =~ /#{arg1}.+Director.+#{arg2}/m
# end
Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  expect(page).to have_content(movie)
  expect(page).to have_content(director)
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  #fail "Unimplemented"
  Movie.all.each do |movie|
    step "I should see \"#{movie.title}\""    
  end 
  
end