module PalavraModule
	export Palavra
	
	type Palavra
		conteudo::AbstractString #Conteudo da palavra
		tamanho::Int #Tamanho da palavra
		caracteres::AbstractString #Caracteres que a palavra contem
		hiddenFace::AbstractString #É uma string com o mesmo tamanho de conteudo, mas preenchida com -, ex:counteudo AAA, hiddenFace ---
		caracteresR::AbstractString #Caracteres com repeticoes
	end
	
	#Retorna os caracteres ordenados, mas sem permitir repetições
	function getOrdenedCharacters(palavra::AbstractString)
		out=Char[]
		for(c in palavra)
			if(!in(c,out))
				push!(out,c)
			end
		end			
		return AbstractString(sort!(out))	
	end
	
	#Retorna os caracteres ordenados, mas com repetições
	function getOrdenedCharactersR(palavra::AbstractString)
		out=Char[]
		for(c in palavra)
			push!(out,c)			
		end			
		return AbstractString(sort!(out))	
	end

	#p2 contem somente caracteres de p1
	function isAnagram(palavra1::Palavra,palavra2::Palavra)		
		for(c in palavra2.conteudo)
			if(in(c,palavra1.caracteres)==false)
				return false
			end	
		end
		return true
	end

	#Gera uma hidden face, in:MACACO out:------
	function generateHiddenFace(s::AbstractString)
		s1=""			
		for c in s
		   s1=s1*"-"			   
		end
		return s1
	end

	#p2 contem somente caracteres de p1
	function isAnagramStr(palavra1::ASCIIString,palavra2::Palavra)
		for(c in palavra2.conteudo)
			if(in(c,palavra1)==false)
				return false
			end	
		end
		return true
	end
end

