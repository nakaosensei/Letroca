module MainModule using PalavraControllerModule,PalavraModule,FilterModule,GameModule,WebModule
	x=zeros(UInt8,4)
	#out=WebModule.getDados("https://pt.wikipedia.org/wiki/Cuscuz")
	#out=FilterModule.removeTrashText(out)
	#println(out)	
	GameModule.showOptions()
	while(x!=4)				
		x=readline(STDIN)
		GameModule.doActions(x)					
	end
		
end



