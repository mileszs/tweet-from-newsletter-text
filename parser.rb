# Assuming URLs enclosed by parens, this will get twitter URLs that look like
# http://twitter.com/dhh
# but will ignore
# http://twitter.com/dhh/statuses/5858382858
TWITTER_LINKS = /twitter\.com\/([\w]*)[\/]{0,1}\)/

usernames = File.open('email.txt', 'r').readlines.map do |line|
  matches = line.scan(TWITTER_LINKS).flatten
end.compact.flatten

['mileszs', '_swanson'].each { |n| usernames.delete(n) }

puts "Hacks && Happenings is in your inbox, with content from #{usernames.uniq.map { |u| "@#{u}" }.join(', ')}!"
