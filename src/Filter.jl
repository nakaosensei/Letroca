module FilterModule

	#Retorna tudo que estiver entre todos o <p e </p de toda a string
	function getWhatIsBetweenParagraphs(texto::AbstractString)#retorna todo o texto entre <p> e </p>
		vet=split(texto,"<p")
		out=""
		for s in vet
			if(contains(s,"</p")==true)
				tmp=split(s,"</p")
				out=out*tmp[1]*"\n"
			end
		end
		return out
	end


	#Remove tudo que estiver entre essas duas strings
	function removeBetweenStrings(s1::AbstractString,s2::AbstractString,texto::AbstractString)
		vet=split(texto,s1)
		out=""
		for str in vet			
			if(contains(str,s2)==false)
				out=out*str
			else
				tmp=split(str,s2)
				for i=2:length(tmp)
					out=out*tmp[i]
				end
								
			end
		end
		return out				
	end

	#Remove os lixos de tag HTML
	function removeTrashText(texto::AbstractString)
		texto=removeBetweenStrings("<sup","</sup",texto)
		texto=removeBetweenStrings("<span","</span",texto)
		texto=removeBetweenStrings("<a","</a",texto)
		texto=removeBetweenStrings("<script","</script",texto)
		texto=removeBetweenStrings("class=\"","\">",texto)
		out=getWhatIsBetweenParagraphs(texto)		
		out=replace(out,"</b>","")
		out=replace(out,"<b>","")
		out=replace(out,"</i>","")
		out=replace(out,"<i>","")				
		return out
	end


	function removerPontos(texto::AbstractString)
		return replace(texto, ".", " ")
	end
	
	function removerVirgulas(texto::AbstractString)
		return replace(texto, ","," ")	
	end
 
	function removerParenteses(texto::AbstractString)
		texto = replace(texto, "("," ")
		return replace(texto, ")"," ")
	end

	function removerColchetes(texto::AbstractString)
		texto = replace(texto, "["," ")
		return replace(texto,"]"," ")
	end	

	function removerSetas(texto::AbstractString)
		texto = replace(texto,">"," ")
		texto = replace(texto,"<"," ")
		return texto
	end

	function removerBarras(texto::AbstractString)
		texto = replace(texto,"/","")
		texto = replace(texto,"\\","")
		return texto
	end	

	function removerGrupoCaracteresEspeciais(texto::AbstractString)
		texto = replace(texto,"!"," ")
		texto = replace(texto,"@"," ")
		texto = replace(texto,"#"," ")
		texto = replace(texto,"\$"," ")
		texto = replace(texto,"%"," ")
		texto = replace(texto,"\""," ")
		texto = replace(texto,"&"," ")
		texto = replace(texto,"*"," ")
		texto = replace(texto,"_"," ")
		texto = replace(texto,"+"," ")
		texto = replace(texto,"="," ")
		texto = replace(texto,"-"," ")
		texto = replace(texto,"|"," ")
		texto = replace(texto,"'"," ")
		texto = replace(texto,"¨"," ")
		texto = replace(texto,";"," ")
		texto = replace(texto,":"," ")
		texto = replace(texto,"?"," ")
		texto = replace(texto,"{"," ")
		texto = replace(texto,"}"," ")
		texto = replace(texto,"^"," ")
		texto = replace(texto,"\t"," ")
		texto = replace(texto,"¨"," ")
		texto = replace(texto,"~"," ")
		texto = replace(texto,"´"," ")
		texto = replace(texto,"`"," ")		
		return texto
	end

	function removerNumeros(texto::AbstractString)
		texto = replace(texto,"0"," ")		
		texto = replace(texto,"1"," ")
		texto = replace(texto,"2"," ")
		texto = replace(texto,"3"," ")
		texto = replace(texto,"4"," ")
		texto = replace(texto,"5"," ")
		texto = replace(texto,"6"," ")
		texto = replace(texto,"7"," ")
		texto = replace(texto,"8"," ")
		return replace(texto,"9"," ")		
	end

	toUpperCase(texto::AbstractString) = uppercase(texto)


	function replaceAcentuacoes(texto::AbstractString)
		texto = replace(texto,"Ã","A")
		texto = replace(texto,"Á","A")
		texto = replace(texto,"À","A")
		texto = replace(texto,"Â","A")
		texto = replace(texto,"Ẽ","E")
		texto = replace(texto,"É","E")
		texto = replace(texto,"È","E")
		texto = replace(texto,"Ê","E")
		texto = replace(texto,"Ĩ","I")
		texto = replace(texto,"Í","I")
		texto = replace(texto,"Ì","I")
		texto = replace(texto,"Î","I")
		texto = replace(texto,"Õ","O")
		texto = replace(texto,"Ó","O")
		texto = replace(texto,"Ò","O")
		texto = replace(texto,"Ô","O")
		texto = replace(texto,"Ũ","U")
		texto = replace(texto,"Ú","U")
		texto = replace(texto,"Ù","U")
		texto = replace(texto,"Û","U")
		texto = replace(texto,"Ŵ","W")
		texto = replace(texto,"Ẃ","W")
		texto = replace(texto,"Ẁ","W")		
		texto = replace(texto,"Ŕ","R")		
				
	end
		
	function removeEmptyObjects{str<:AbstractString}(v1::Array{str,1})
		palavras=AbstractString[]		
		for s in v1
			if(length(s)>0)
				push!(palavras,s)
			end
		end
		return palavras
	end	
	
	function filtrar(texto::AbstractString)
		texto = removerPontos(texto)
		texto = removerVirgulas(texto)
		texto = removerParenteses(texto)
		texto = removerColchetes(texto)
		texto = removerNumeros(texto)
		texto = removerSetas(texto)
		texto = removerBarras(texto)
		texto = removerGrupoCaracteresEspeciais(texto)		
		texto=  toUpperCase(texto)
		texto = replaceAcentuacoes(texto)
		texto = replace(texto,"\n","")			
		return texto
	end	
end
