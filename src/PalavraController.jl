module PalavraControllerModule
	export PalavraController
	using PalavraModule

	type PalavraController
		palavras::Array{Palavra,1}
		palavraEscolhida::Int32
		
	end



	function printHiddenFaces(words::Array{Palavra})
		for p in words
			println(p.hiddenFace)
		end
	end

	function printWords(words::Array{Palavra})
		for p in words
			println(p.conteudo)
		end
	end

	function findGreaterWord(words::Array{Palavra})
		maior=words[1]
		for p in words			
			if(length(maior.conteudo)<length(p.conteudo))
				maior=p;
			end	
		end
		return maior
	end

	#Esta funcao retorna a primeira palavra cujo tamanho seja
	#igual ao passado por parametro ou, caso uma palavra com este
	#tamanho não exista, uma palavra maior que o tamanho da
	#escolhida é retornado, mas caso não haja nenhuma palavra
	#maior que a do tamanho passado, retorna-se a maior palavra
	#do Array
	function findWordWithThatSize(words::Array{Palavra,1},size::Int64)
		maior=words[1]
		foundGreaterWord=false;
		for p in words
			if(length(p.conteudo)==size)
				return p
			elseif(length(p.conteudo)>size && foundGreaterWord==false)
				maior=p
				foundGreaterWord=true
			end
		end
		if(foundGreaterWord==false)
			return findGreaterWord(words)
		end
		return maior	
	end	
end

