s1 = "The quick brown fox jumps over the lazy dog α,β,γ"
println(s1)

print("this")
print(" and")
print(" that.\n")

c1 = 'a'
println(c1)
println(c1, " ascii value = ", Int(c1))
println("Int('α') == ", Int('α'))

println(Int('1') == 1)

s1_caps = uppercase(s1)  
s1_lower = lowercase(s1) 
println(s1_caps, "\n", s1_lower)

# sub strings can be indexed like arrays:
# (show prints the raw value)
show(s1[11]); println()


# or sub strings can be created:
show(s1[1:10]); println()
#> "The quick "

# end is used for the end of the array or string
show(s1[end-10:end]); println()
#> "dog α,β,γ"

# julia allows string Interpolation:
a = "wolcome"
b = "julia"
println("$a to $b.")
#> wolcome to julia.

# this can extend to evaluate statements:
println("1 + 2 = $(1 + 2)")
#> 1 + 2 = 3

# strings can also be concatenated using the * operator
# using * instead of + isn't intuitive when you start with Julia,
# however people think it makes more sense
s2 = "this" * " and" * " that"
println(s2)
#> this and that

# as well as the string function
s3 = string("this", " and", " that")
println(s3)
#> this and that

