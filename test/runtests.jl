using Test
using Example2018

#Tests
# Polynomials form a ring
# 1. addition is associative
# 2. addition is identity
# 3. additive inverse
# 4. addition commutes 
# 5. multiplication is ...

@testset "Polynomials form a ring" begin 
# test commands

	z = Polynomial([0])
	for  n in 1:100
		#degree
		deg = rand(0:100)
		p = Polynomial(rand(-1000:1000,deg+1))

		@test z + p == p
		@test p + z == p
		@test p + (-p) == z
	end
end
#test set 

#@show Polynomial([1,2,3])
#@show evaluate(Polynomial([1,2,3]), 2)
#@show Polynomial([1,2,3]) + Polynomial([4,5]) 
#@show 3*Polynomial([1,2,3]) 
#@show deriv(Polynomial([0,0,1,0]))


# 
