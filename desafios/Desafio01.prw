#include 'protheus.ch'

/*
Pe�a dois n�meros ao usu�rio e exiba: soma, subtra��o, multiplica��o e divis�o.
*/

user function desafio1()

	//Declara��o de variaveis
	Local aPergs        := {}
	Local aResps        := {}
	Local nNum1         := 0
	Local nNum2         := 0
	Local nSoma			:= 0
	Local nSub 			:= 0
	Local nMult 		:= 0
	Local nDiv 			:= 0


	//Solicita��o dos numeros ao usuario
	aAdd(aPergs,{1,"Digite o primeiro numero: ",nNum1,"9999","","","",30,.T.})
	aAdd(aPergs,{1,"Digite o segundo numero: ",nNum2,"9999","","","",30,.T.})


	//Exibir resultados
	If ParamBox(aPergs, "Resultados", aResps)
		nNum1				:= aResps[1]
		nNum2				:= aResps[2]
		nSoma				:= nNum1 + nNum2
		nSub	 			:= nNum1 - nNum2
		nMult		 		:= nNum1 * nNum2
		nDiv	 			:= nNum1 / nNum2

		Alert("Soma: " + cValToChar(nSoma)+"." + Chr(13) + Chr(10);
			+ "Subtra��o: " + cValToChar(nSub)+"." + Chr(13) + Chr(10);
			+ "Multiplica��o: " + cValToChar(nMult)+"." + Chr(13) + Chr(10);
			+ "Divis�o: " + cValToChar(nDiv)+".")

	EndIf

return
