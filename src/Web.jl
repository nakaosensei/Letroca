module WebModule using Requests
	entrada=""
	#Retorna o codigo HTML da pagina do fogo da Wikipedia	
	function getDadosFogo()		
		res = get("https://pt.wikipedia.org/wiki/Fogo")
		entrada=readall(res)
		return entrada
	end	
	#Retorna o codigo HTML de um link
	function getDados(link::AbstractString)
		res = get(link)
		entrada=readall(res)
	        return entrada
	end
end
