#include 'Protheus.ch'

/*
Programa para verificar se o ano � bissexto
Autor: Iuri Souza 
Data: 14/10/2025
*/
User Function AnoBissexto()

	//Declara��o de variaveis
	Local aPergs        := {}
	Local aResps        := {}
	Local nAno          := 0

	//Solicita��o ano ao usuario
	aAdd(aPergs,{1,"Digite o ano que deseja conferir: ",nAno,"@E 9999","","","",50,.T.})

	//Exibir resultados

	If ParamBox(aPergs, "Resposta", aResps)
		nAno := aResps[1]

		If (nAno % 4 == 0)
			If (nAno % 100 == 0)
				If (nAno % 400 == 0)
					Help(Nil, Nil, "Aviso", Nil, "O ano " + CValToChar(nAno) + " � bissexto!", 1, 0)
				Else
					Help(Nil, Nil, "Aviso", Nil, "O ano " + CValToChar(nAno) + " N�O � bissexto!", 1, 0)
				EndIf
			Else
				Help(Nil, Nil, "Aviso", Nil, "O ano " + CValToChar(nAno) + " � bissexto!", 1, 0)
			EndIf
		Else
			Help(Nil, Nil, "Aviso", Nil, "O ano " + CValToChar(nAno) + " N�O � bissexto!", 1, 0)
		EndIf
	Else
		Help(Nil, Nil, "Aviso", Nil, "O ano N�O � bissexto", 1, 0)
	EndIf

Return
