module PalavraControllerModule
	export Palavra_Controller
	using PalavraModule

	type Palavra_Controller
		palavras::Array{Palavra,1}
		mapLetras::Dict{AbstractString, Palavra}
	end
end

