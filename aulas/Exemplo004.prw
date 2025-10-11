#include 'Protheus.ch'

//Faça um programa que some os numeros primos da sequencia de 1 a 1000 e exiba o resultado.

user function SomaPrimo()

	Local nResultado            := 0
	Local nI                    := 0
	Local nJ		            := 0
	Local nContador             := 0

	For nX := 1 To 15
		nContador := 0
		For nI := 1 To nx
			If nX % nI == 0
				nContador++
			EndIf
		Next Ni

		If nContador == 2
			nResultado := nResultado + nX
		EndIf
	Next Nx

	Alert("A soma dos números primos da sequencia 1 a 1000 é: " + cValToChar(nResultado))

return
