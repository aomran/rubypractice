require "highline/import"

birthyear = ask("What year were you born in?", Integer) { |q| q.in = 1920..2010 }

birthmonth = ask("What month were you born in?", Integer) { |q| q.in = 1..12 }

birthday = ask("What day were you born on?", Integer) { |q| q.in = 1..31 }

say "#{birthyear}/#{birthmonth}/#{birthday}"

say Date.new(birthyear, birthmonth, birthday).to_s

say Date.today.to_s

days = Date.today - Date.new(birthyear, birthmonth, birthday)

years = (days / 365).to_i

years.times {say "SPANK!"}
# birthmonth = ask ("what month were you born in?") do |q|
# 	q.in = 1..12
# end


