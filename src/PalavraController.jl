module PalavraControllerModule
	export PalavraController
	using PalavraModule

	type PalavraController
		palavras::Array{Palavra,1}
		palavraEscolhida::Int32
		
	end

	#Printa o hidden face das palavras
	function printHiddenFaces(words::Array{Palavra})
		for p in words
			println(p.hiddenFace)
		end
	end

	#Printa o conteudo das palavras
	function printWords(words::Array{Palavra})
		for p in words
			println(p.conteudo)
		end
	end

	#Acha a palavra com o maior tamanho do array
	function findGreaterWord(words::Array{Palavra})
		maior=words[1]
		for p in words			
			if(length(maior.conteudo)<length(p.conteudo))
				maior=p;
			end	
		end
		return maior
	end

	#Esta funcao retorna uma palavra aleatoria cujo tamanho seja
	#igual ao passado por parametro ou, caso uma palavra com este
	#tamanho não exista, uma palavra maior que o tamanho da
	#escolhida é retornado, mas caso não haja nenhuma palavra
	#maior que a do tamanho passado, retorna-se a maior palavra
	#do Array
	function findWordWithThatSize(words::Array{Palavra,1},size::Int64)
		possibleWords=Palavra[]
		foundWord=false	
		maior=words[1]
		foundGreaterWord=false;
		for p in words
			if(length(p.conteudo)==size)
				push!(possibleWords,p)
				foundWord=true
			elseif(length(p.conteudo)>size && foundGreaterWord==false)
				maior=p
				foundGreaterWord=true
			end
		end
		if(foundWord==true)
			idx = rand(1:length(possibleWords))
			return possibleWords[idx]
		end
		if(foundGreaterWord==false)
			return findGreaterWord(words)
		end
		return maior	
	end	
end

