#include 'protheus.ch'

/*

1) Faça um programa que some dois números e exiba o resultado

*/

user function SomaDois()

	//Declaração de variaveis
	Local aResps        := {}
	Local aPergs        := {}
	local nA            := 0
	local nB            := 0
	local nResultado    := 0

	//Solicitação dos numeros ao usuario
	aAdd(aPergs,{1,"Digite o primeiro numero",nA,"9999","","","",30,.T.})
	aAdd(aPergs,{1,"Digite o segundo numero",nB,"9999","","","",30,.T.})

	//Exibir resultados
	If ParamBox(aPergs,"Parametros da soma",aResps)
		nResultado := aResps[1] + aResps[2]
		Alert("O resultado da soma é: " + cValToChar(nResultado))
	else
		Alert("Processo cancelado pelo usuário")
	Endif

return
