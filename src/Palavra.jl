module PalavraModule
	export Palavra
	
	type Palavra
		conteudo::AbstractString
		tamanho::Int
		caracteres::AbstractString
		hiddenFace::AbstractString
		caracteresR::AbstractString #Caracteres com repeticoes
	end
	
	function getOrdenedCharacters(palavra::AbstractString)
		out=Char[]
		for(c in palavra)
			if(!in(c,out))
				push!(out,c)
			end
		end			
		return AbstractString(sort!(out))	
	end

	function getOrdenedCharactersR(palavra::AbstractString)
		out=Char[]
		for(c in palavra)
			push!(out,c)			
		end			
		return AbstractString(sort!(out))	
	end

	function isAnagram(palavra1::Palavra,palavra2::Palavra)
		#p2 contem somente caracteres de p1
		for(c in palavra2.conteudo)
			if(in(c,palavra1.caracteres)==false)
				return false
			end	
		end
		return true
	end

	function generateHiddenFace(s::AbstractString)
		s1=""			
		for c in s
		   s1=s1*"-"			   
		end
		return s1
	end
	function isAnagramStr(palavra1::ASCIIString,palavra2::Palavra)
		#p2 contem somente caracteres de p1
		#println(palavra1*" - "*palavra2.conteudo)
		for(c in palavra2.conteudo)
			if(in(c,palavra1)==false)
				return false
			end	
		end
		return true
	end
end

