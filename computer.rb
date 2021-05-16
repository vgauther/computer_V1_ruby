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

def put_members(m)

	m.each do |x|
		puts "sign : " + x.sign.to_s + " | exposant : " + x.exposant.to_s + " | mult : " + x.mult.to_s
	end
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
	equa = ARGV[0].dup
	while equa[s]
		if equa[s] == '-'
			tmp = -1
			equa[s] = '+'
		end
		if equa[s] == 'X'
			members[m].sign = tmp
			m = m + 1
			tmp = 1
		end
		s = s + 1
	end

	tab = equa.split("=")
	left = tab[0]
	right = tab[1]
	tab1 = tab[0].split("+")
	s = 0
	tab1.each do |b|
		tp = b.split("^")
		members[s].exposant = tp[1].to_i
		ttp = tp[0].split("*")
		members[s].mult = ttp[0].to_f
		s = s + 1
	end

	tab2 = tab[1].split("+")
	tab2.each do |b|
		tp = b.split("^")
		members[s].exposant = tp[1].to_i
		ttp = tp[0].split("*")
		members[s].mult = ttp[0].to_f
		s = s + 1
	end
	puts ARGV[0]
	put_members(members)
end

main
