#include 'protheus.ch'

//Fa�a um programa que some os numeros pares e multiplique os numeros impares da sequencia de 1 a 100 e exiba os dois resultados.

user function Teste003()

	Local nX            := 0
	Local nResPar       := 0
	Local nResImp		:= 0

	For nX := 1 To 100
		If nX % 2 == 0
			nResPar := nResPar + nX
		else
			if nX == 1
				nResImp := nX
			else
				nResImp := nResImp + nX
			EndIf
		EndIf
	Next nX

	Alert("A soma dos n�meros pares �: " + cValToChar(nResPar))
	Alert("A multiplica��o dos n�meros impares �: " + cValToChar(nResImp))


return
