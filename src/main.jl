module MainModule using PalavraControllerModule,FileModule,PalavraModule,FilterModule,GameModule
	x=zeros(UInt8,4)
	GameModule.showOptions()
	while(x!=4)				
		x=readline(STDIN)
		GameModule.doActions(x)					
	end
		
end



