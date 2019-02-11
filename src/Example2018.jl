module Example2018

export Point
struct Point{T}
	x::T
	y::T
end

function Base. +(p::Point, q::Point)
	Point(p.x + q.x, p.y + q.y)
end

export MPoint

mutable struct MPoint{T}
	x::T
	y::T
end

#######################################

export Polynomial
struct Polynomial{T}
	coeffs::Vector{T}
end

export evaluate
function evaluate(p::Polynomial, z)
	sum(c * z^(i-1) for (i,c) in enumerate(p.coeffs))	
end

function Base. +(p::Polynomial, q::Polynomial)
	l = max(length(p.coeffs), length(q.coeffs))
	rcoeffs = zeros(eltype(p.coeffs),l)
	for (i,c) in enumerate(p.coeffs)
		rcoeffs[i] += c
	end
	for (i,c) in enumerate(q.coeffs)
		rcoeffs[i] += c
	end
	Polynomial(rcoeffs)	
end

function Base. -(p::Polynomial)
	(-1) * p
end

function Base. -(p::Polynomial, q::Polynomial)
	p + (-q)	
end

#comparisson function
function Base. ==(p::Polynomial, q::Polynomial)
	d = p - q
	#all(c -> c== 0, d.coeffs)
	all(d.coeffs .== 0)
	#all takes a list of boolean statements 
	#and checks wether they are all true	
end


function Base. *(a, p::Polynomial)
	Polynomial(map(x -> a*x, p.coeffs))
end

export deriv
function deriv(p::Polynomial)
	Polynomial([(i-1) * c for (i,c) in enumerate(p.coeffs)][2:end])
end

end # module



