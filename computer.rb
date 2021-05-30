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
	if zz == 1
		ret = f
	else
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
	if m[0].sign == 1
		str = ""
	else
		str = "- "
	end
	s = 0
	while s <= h_exp
		if m[s].sign == 1 && s > 0
			ss = " + "
		elsif m[s].sign == -1 && s > 0
			ss = " - "
		else
			ss = ""
		end
		str = str + ss + stay_float(m[s].mult).to_s + " * X^" + m[s].exposant.to_s
		s = s + 1
	end
	puts "Reduced form: " + str + " = 0"
	puts "Polynomial degree: " + h_exp.to_s
end

def sqq(x)
	ret = x * x
	ret
end

def rac(x)
	ret = 0.0
	pl = 1.00
	hello = 0
	while (ret * ret) <= x && hello < 16
		while (ret * ret) <= x
			ret = ret + pl
		end
		ret = ret - pl
		if (ret * ret) == x
			return ret
		end
		if hello == 15
			return ret
		else
			pl = pl / 10.00
			hello = hello + 1
		end
	end
	ret
end

def print_s(x)
	sx = x.to_s
	i = 0
	j = sx.length

	if j > 7
		j = 7
	end
	pr = ""
	while i < j
		pr = pr + sx[i]
		i = i + 1
	end
	if sx[i] > '4'
		puts "cc"
		puts pr[i-1]
		pr[i - 1] = (pr[i - 1].to_i + 1).to_s
	end
	puts pr
end

def lets_solv(m, h_exp)
	if h_exp > 2
		puts "The polynomial degree is stricly greater than 2, I can't solve."
	elsif h_exp == 2
		a = m[2].mult * m[2].sign
		b = m[1].mult * m[1].sign
		c = m[0].mult * m[0].sign
		puts a
		puts b
		puts c

		delta = (b * b) - (4.00 * a * c)
		puts "Delta is: " + delta.to_s
		if delta == 0
			puts "The discriminant is equal to 0. There is only one solution: "
			x = -1 * (b / 2 * a)
			puts x
		elsif delta > 0
			puts "Discriminant is strictly positive, the two solutions are: "
			x = ((-1 * b - rac(delta)) / (2 * a)).to_s
			x1 = ((-1 * b + rac(delta)) / (2 * a)).to_s
			print_s(x)
			print_s(x1)

		else
			puts "The discriminant is strictly negative. There is no real solution."

		end
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
		members[s].sign = members[s].sign * -1
		s = s + 1
	end
	puts "Initial form: " + ARGV[0]
	#put_members(members)
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

def main1
 	puts "racine de 9 = " + rac(9).to_s + " | " + Math.sqrt(9).to_s
	puts "racine de 19 = " + rac(19).to_s + " | " + Math.sqrt(19).to_s
	puts "racine de 9.5 = " + rac(9.5).to_s + " | " + Math.sqrt(9.5).to_s
	puts "racine de 59 = " + rac(59).to_s + " | " + Math.sqrt(59).to_s
	puts "racine de 93 = " + rac(93).to_s + " | " + Math.sqrt(93).to_s
end

main
