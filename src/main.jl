module MainModule using PalavraControllerModule,FileModule,PalavraModule
	palavraSA=AbstractString[]
	push!(palavraSA,"A")
	for s in fileStringArray
		append!(palavraSA,split(s," "))
	end		
	for s in palavraSA
		println(s)
	end		
end



