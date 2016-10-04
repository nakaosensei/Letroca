module MainModule using GameModule
	x=-1
	while(true)
		GameModule.showOptions()#Mostra o menu
		try
			x=parse(Int64,readline(STDIN))#Lê a entrada
			GameModule.doActions(x)	#Chama a função do jogo que define o que será feito
		catch
			println("Entrada invalida, somente numeros sao permitidos. =(")	#O usuario digitou uma entrada invalida
		end							
	end		
end



