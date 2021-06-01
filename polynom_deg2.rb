require_relative 'math.rb'

def polynom_delta_neg(a, b, delta)
	puts "The discriminant is strictly negative. There is no real solution."
	puts "Delta is: " + delta.to_s + " = " + (delta * -1).to_s + "i"
	puts "The solutions are :"
	if b < 0
		puts "(" + b.to_s + " - i" + rac(delta * -1).round(6).to_s + ") / " + (2 * a).to_s
		puts "(" + b.to_s + " + i" + rac(delta * -1).round(6).to_s + ") / " + (2 * a).to_s
	else
		puts "(-" + b.to_s + " - i" + rac(delta * -1).round(6).to_s + ") / " + (2 * a).to_s
		puts "(-" + b.to_s + " + i" + rac(delta * -1).round(6).to_s + ") / " + (2 * a).to_s
	end
end

def polynom_delta_pos(a, b, delta)
	puts "Discriminant is strictly positive, the two solutions are: "
	puts (((-1 * b) - rac(delta)) / (2 * a)).round(6).to_s
	puts (((-1 * b) + rac(delta)) / (2 * a)).round(6).to_s
end

def polynom_delta_zer(a, b, delta)
	puts "The discriminant is equal to 0. There is only one solution: "
	puts (-1 * (b / 2 * a)).round(6).to_s
end
