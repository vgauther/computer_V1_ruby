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

def make_delta(a, b, c)
	x = (b * b) - (4.00 * a * c)
	x
end
