module FilterModule
	function removerPontos(texto::AbstractString)
		return replace(texto, ".", "")
	end
	
	function removerVirgulas(texto::AbstractString)
		return replace(texto, ",","")	
	end
 
	function removerParenteses(texto::AbstractString)
		texto = replace(texto, "(","")
		return replace(texto, ")","")
	end

	function removerColchetes(texto::AbstractString)
		texto = replace(texto, "[","")
		return replace(texto,"]","")
	end	

	function removerSetas(texto::AbstractString)
		texto = replace(texto,">","")
		texto = replace(texto,"<","")
		return texto
	end

	function removerBarras(texto::AbstractString)
		texto = replace(texto,"/","")
		texto = replace(texto,"\\","")
		return texto
	end	

	function removerGrupoCaracteresEspeciais(texto::AbstractString)
		texto = replace(texto,"!","")
		texto = replace(texto,"@","")
		texto = replace(texto,"#","")
		texto = replace(texto,"\$","")
		texto = replace(texto,"%","")
		texto = replace(texto,"¨","")
		texto = replace(texto,"&","")
		texto = replace(texto,"*","")
		texto = replace(texto,"_","")
		texto = replace(texto,"+","")
		texto = replace(texto,"-","")
		texto = replace(texto,"|","")
		texto = replace(texto,"'","")
		texto = replace(texto,";","")
		texto = replace(texto,":","")
		texto = replace(texto,"?","")
		texto = replace(texto,"{","")
		texto = replace(texto,"}","")
		texto = replace(texto,"^","")
		texto = replace(texto,"~","")
		texto = replace(texto,"´","")
		texto = replace(texto,"`","")		
		return texto
	end

	function removerNumeros(texto::AbstractString)
		texto = replace(texto,"0","")		
		texto = replace(texto,"1","")
		texto = replace(texto,"2","")
		texto = replace(texto,"3","")
		texto = replace(texto,"4","")
		texto = replace(texto,"5","")
		texto = replace(texto,"6","")
		texto = replace(texto,"7","")
		texto = replace(texto,"8","")
		return replace(texto,"9","")		
	end

	toUpperCase(texto::AbstractString) = uppercase(texto)
		
	function removeEmptyObjects(v::Array{SubString{UTF8String},1})
		palavras=AbstractString[]		
		for s in v
			if(length(s)>0)
				push!(palavras,s)
			end
		end
		return palavras
	end
	
	function filtrar(texto::AbstractString)
		texto=removerPontos(texto)
		texto=removerVirgulas(texto)
		texto = removerParenteses(texto)
		texto = removerColchetes(texto)
		texto = removerNumeros(texto)
		texto = removerSetas(texto)
		texto = removerBarras(texto)
		texto = removerGrupoCaracteresEspeciais(texto)		
		texto=toUpperCase(texto)
		texto = replace(texto,"\n","")			
		return texto
	end	
end
