require_relative 'class_member.rb'

def count_member(str)
	counter = 0
	c = 0
	while str[c]
		if str[c] == 'X'
			counter = counter + 1
		end
		c = c + 1
	end
	counter
end

def main
	#create Members
	nb_member = count_member(ARGV[0])
	members = Array.new(nb_member)
	s = 0
	while s < nb_member
		members[s] = Member.new(0, 0, 0)
		s = s + 1
	end

	s = 0
	m = 0
	tmp = 1

	while ARGV[0][s]
		if ARGV[0][s] == '-'
			tmp = -1
		end
		if ARGV[0][s] == 'X'
			members[m].sign = tmp
			m = m + 1
			tmp = 1
		end
		s = s + 1
	end

	# tab = ARGV[0].split("=")
	# left = tab[0]
	# right = tab[1]
	puts ARGV[0]
	members.each do |l|
		puts l.sign
	end
	puts "-----------------------"
end

main
