#include 'protheus.ch'

//Faça um programa que some os numeros da sequencia de 1 a 100 e exibir o resultado.

user function Soma100()

	Local nX            := 0
	Local nResultado    := 0

	For nX := 1 To 100
		nResultado := nResultado + nX
	Next nX

	Alert(cValToChar(nResultado))

return
