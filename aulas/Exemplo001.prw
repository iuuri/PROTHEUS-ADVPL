#include 'protheus.ch'

/*

1) Fa�a um programa que some dois n�meros e exiba o resultado

*/

user function SomaDois()

	//Declara��o de variaveis
	Local aResps        := {}
	Local aPergs        := {}
	local nA            := 0
	local nB            := 0
	local nResultado    := 0

	//Solicita��o dos numeros ao usuario
	aAdd(aPergs,{1,"Digite o primeiro numero",nA,"9999","","","",30,.T.})
	aAdd(aPergs,{1,"Digite o segundo numero",nB,"9999","","","",30,.T.})

	//Exibir resultados
	If ParamBox(aPergs,"Parametros da soma",aResps)
		nResultado := aResps[1] + aResps[2]
		Alert("O resultado da soma �: " + cValToChar(nResultado))
	else
		Alert("Processo cancelado pelo usu�rio")
	Endif

return
