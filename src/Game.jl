module GameModule using PalavraControllerModule,PalavraModule,FilterModule ,WebModule
	tamanhoPalavra=5
	palavraChave="https://pt.wikipedia.org/wiki/Final_Fantasy"
	chutes=10
	palavras=Palavra[]
	palavrasJogo=Palavra[]

	#Mostra as opcoes do menu			
	function showOptions()
		println("\nBem vindo ao Letroca Nk Version, selecione uma opção:")
		println("0-Defina a quantidade de chutes")		
		println("1-Defina o tamanho da palavra")
		println("2-Defina o link de busca na wikipedia")
		println("3-Jogar")
		println("4-Ver configuracoes")
		println("5-Sair")
	end

	#Função que lê a string de entrada vinda do modulo Web(html), filtra e carrega na estrutura de palavras
	function carregarPalavras()
		global palavras,palavraChave
		palavraSA=AbstractString[]
		out=WebModule.getDados(palavraChave)
		out=FilterModule.removeTrashText(out)
		fileArray = split(out,"\n")
		for s in fileArray
			s = FilterModule.filtrar(s)
			if(length(s)>1)
				subArray=split(s," ")#Splita a string
				subArray=FilterModule.removeEmptyObjects(subArray)#Retira vazios
				for sub in subArray
					if(in(sub,palavraSA)==false)#Se a palavra ainda nao foi adicionada a string
						push!(palavraSA,sub)
					end	
				end				
			end
		end
		for s in palavraSA	#Percorre a string com as palavras e popula as estruturas de palavra
			tmp=PalavraModule.getOrdenedCharactersR(s)	
			instPalavra=Palavra(s,length(s),PalavraModule.getOrdenedCharacters(s),PalavraModule.generateHiddenFace(s),tmp)		
			push!(palavras,instPalavra)					
		end
	end	

	#Dado a lista de palavras carregadas e a palavra selecionada como maior do jogo, filtra as palavras
	#que serão usadas no jogo a partir da maior, as palavras aceitas serao somente as que tiverem os mesmos
	#caracteres que a maior.	
	function selecionarPalavrasDoJogo(maior::Palavra,palavras::Array{Palavra})
		palavrasJogo=Palavra[]		
		for p in palavras
		   if ((PalavraModule.isAnagram(maior,p)==true)&&(length(p.conteudo)<length(maior.conteudo))&&(length(p.conteudo)>2))
			push!(palavrasJogo,p)												
		    end	
		end
		return palavrasJogo
	end
	
	function doActions(x::Int64)
		global palavraChave
		global tamanhoPalavra
		global palavras
		global chutes
		global palavrasJogo
		if(x==0)#Setar quantidade de chutes
			println("Digite a quantidade de chutes desejada:")
			try
				chutes=parse(Int64,readline(STDIN))
				println("O numero de chutes foi setado para ",chutes)
								
			catch
				println("Entrada invalida, somente numeros sao permitidos. =(")	
			end
		elseif(x==1)#Setar tamanho da palavra
			println("Digite o tamanho da palavra desejada:")
			try
				tamanhoPalavra=parse(Int64,readline(STDIN))
				println("O tamanho da palavra foi setado para ",tamanhoPalavra)
								
			catch
				println("Entrada invalida, somente numeros sao permitidos. =(")	
			end									
		elseif(x==2)#Setar link da wikipedia
			println("Digite o link da wikipedia")
			palavraChave=readline(STDIN)
			palavraChave=replace(palavraChave,"\n","")
			println("A palavra chave foi setada para ",palavraChave)
		elseif(x==3)#Jogar
			carregarPalavras()			
			maior = PalavraControllerModule.findWordWithThatSize(palavras,tamanhoPalavra)
			palavrasJogo=selecionarPalavrasDoJogo(maior,palavras)
			print("A maior palavra tem "*string(length(maior.conteudo)))
			print(" caracteres, voce pode chutar as letras "*maior.caracteresR*" Boa sorte!.\n")
			tmpChutes=chutes					
			while(contains(maior.hiddenFace,"-")==true&&tmpChutes>0)
				println("Chances:"*string(tmpChutes))				
				PalavraControllerModule.printHiddenFaces(palavrasJogo)
				println(maior.hiddenFace)
				println("Digite uma palavra, use as letras "*maior.caracteresR*", a maior palavra tem exatamente essas!")
				recebido=uppercase(readline(STDIN))
				recebido=replace(recebido,"\r","")
				recebido=replace(recebido,"\n","")
				if(maior.conteudo==recebido)
					maior.hiddenFace=maior.conteudo
					println("PARABENS! Acertou! A palavra era: "*maior.conteudo)
					println("Abaixo todas as palavras deste jogo:")
					PalavraControllerModule.printWords(palavrasJogo)
					println(maior.conteudo)	
				end							
				for(pl in palavrasJogo)									
					if(pl.conteudo==recebido)
						pl.hiddenFace=pl.conteudo
						tmpChutes+=1
					end
				end				
				tmpChutes-=1								
			end
			if(tmpChutes<=0)
				println("Game over... ")
				PalavraControllerModule.printWords(palavrasJogo)
				println(maior.conteudo)	
			end
			palavras=Palavra[]
			palavrasJogo=Palavra[]			
		elseif(x==4)#Mostrar estado
			println("Palavra chave(Busca Wikipedia): "*palavraChave)
			println("Tamanho palavra: ",tamanhoPalavra)
			println("Quantidade de chutes: ",chutes)			
		elseif(x==5)#Quit
			quit()
		end		
	end		
end
