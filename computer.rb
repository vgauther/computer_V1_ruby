require_relative 'class_member.rb'
require_relative 'math.rb'
require_relative 'polynom_deg2.rb'


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

def stay_float(f)
	str = f.to_s
	t = str.split(".")
	zz = 0
	l = t[1].length
	l.times do |x|
		if t[1][x] != '0'
			zz = 1
		end
	end
	ret = f
	if zz != 1
		ret = f.to_i
	end
	ret
end

def givethenum(m, exp)
	n = 0
	m.each do |x|
		if exp == x.exposant
			n = n + x.mult * x.sign.to_f
		end
	end
	n
end

def higher_exp(m)
	ret = 0
	m.each do |x|
		if ret < x.exposant
			ret = x.exposant
		end
	end
	ret
end

def print_reduced(m, h_exp)
	str = ""
	if m[0].sign != 1
		str = str + "- "
	end
	s = 0
	tok = 0
	while s <= h_exp
		if m[s].mult && m[s].mult != 0
			if m[s].sign == 1 && tok != 0
				ss = " + "
			elsif m[s].sign == -1 && tok != 0
				ss = " - "
			else
				ss = ""
			end
			tok = 1
			str = str + ss + stay_float(m[s].mult).to_s + " * X^" + m[s].exposant.to_s
		end
		s = s + 1
	end
	if tok == 0
		str = "0"
	end
	puts "Reduced form: " + str + " = 0"
	puts "Polynomial degree: " + h_exp.to_s
end

def check_all_z(m, h_exp)
	x = 0
	t = 0
	while x < h_exp
		if m[x].mult != 0
			t = 1
		end
		x = x + 1
	end
	if t == 0
		puts "All the real numbers are solutions."
		exit()
	end
end

def lets_solv(m, h_exp)
	check_all_z(m, h_exp)
	if h_exp > 2
		puts "The polynomial degree is stricly greater than 2, I can't solve."
	elsif h_exp < 0
		puts "The polynomial degree is stricly smaller than 0, I can't solve."
	elsif h_exp == 2
		a = m[2].mult * m[2].sign
		b = m[1].mult * m[1].sign
		c = m[0].mult * m[0].sign
		if a == 0 && b == 0
			puts "All the real numbers are solutions."
			exit()
		end
		delta = make_delta(a, b, c)
		puts "Delta is: " + delta.to_s
		if delta == 0
			polynom_delta_zer(a, b, delta)
		elsif delta > 0
			polynom_delta_pos(a, b, delta)
		else
			polynom_delta_neg(a, b, delta)
		end
	elsif h_exp == 1
		if m[1].mult == 0
			puts "All the real numbers are solutions."
			exit()
		end
		puts "The solution is: "
		puts ((m[0].sign * m[0].mult * -1) / m[1].mult).round(6).to_s
	elsif h_exp == 0
		puts "All the real numbers are solutions."
	end
end

def main
	if !ARGV[0]
		puts "ruby computer <polynome>"
		exit()
	end
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
		members[s].sign = members[s].sign * -1
		s = s + 1
	end
	puts "Initial form: " + ARGV[0]
	h_exp = higher_exp(members)
	solv = Array.new(h_exp)
	s = 0
	while s <= h_exp
		solv[s] = Member.new(0, s, 0)
		s = s + 1
	end
	s = 0
	while s <= h_exp
		solv[s].mult = givethenum(members, s)
		if solv[s].mult < 0
			solv[s].sign = -1
			solv[s].mult = solv[s].mult * -1.00
		else
			solv[s].sign = 1
		end
		s = s + 1
	end
	print_reduced(solv, h_exp)
	lets_solv(solv, h_exp)
end

main
