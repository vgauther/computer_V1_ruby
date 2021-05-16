class Member
	def initialize(sign, exposant, mult)
		@sign = sign # plus ou moins
		@exposant = exposant # l'exposant
		@mult = mult # multipliant
	end

	def sign
		@sign
	end

	def exposant
		@exposant
	end

	def mult
		@mult
	end

	def sign=(sign)
		@sign=sign
	end

	def exposant=(exposant)
		@exposant=exposant
	end

	def mult=(mult)
		@mult=mult
	end
end
