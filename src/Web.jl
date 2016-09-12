module WebModule using Requests
	entrada=""
		
	function getDadosFogo()		
		res = get("https://pt.wikipedia.org/wiki/Fogo")
		entrada=readall(res)
		return entrada
	end	

	function getDados(link::AbstractString)
		res = get(link)
		entrada=readall(res)
		return entrada
	end

end
