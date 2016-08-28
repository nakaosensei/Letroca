module MainModule using PalavraControllerModule,FileModule,PalavraModule,FilterModule
	palavraSA=AbstractString[]
	fileArray = FileModule.fileStringArray
	for s in fileArray
		s = FilterModule.filtrar(s)
		if(length(s)>1)
			subArray=split(s," ")				
			append!(palavraSA,FilterModule.removeEmptyObjects(subArray))
		end
	end	
	palavra=Palavra[]
	#instPalavra=(Palavra)Palavra	
	for s in palavraSA
		println(s)
		#instPalavra.conteudo=s
		#instPalavra.tamanho=length(s)
		
		#palavra.catacteres=					
	end		
end



