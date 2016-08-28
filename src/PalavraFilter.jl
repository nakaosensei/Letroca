module PalavraFilterModule
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

	
	function filtrar(texto::AbstractString)
		texto=removerPontos(texto)
		texto=removerVirgulas(texto)
		texto = removerParenteses(texto)
		texto = removerColchetes(texto)
		texto = removerNumeros(texto)
		texto=toUpperCase(texto)
		texto = replace(texto,"\n","")			
		return texto
	end	
end
