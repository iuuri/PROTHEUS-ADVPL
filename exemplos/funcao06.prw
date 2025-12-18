#include "Protheus.ch"

/*/-------------------------------------------------
{Protheus.doc} ListaNomes
Projeto 6 — Trabalhando com arrays (lista de nomes)
@Author     Iuri Souza
@since      16/12/2025
@Version    15/superior
------------------------------------------------------/*/

User Function ListaNomes()

	//Declaração de variaveis
	Local aPergOpc      := {}
	Local aRespOpc      := {}
	Local lContinua   	:= .T.
	Local aCombo 				:= {"Opções","1 - Adicionar nome" , "2 - Remover nome" , "3 - Listar nomes", "4 - Sair"}
	Local cEscolha			:= ""
	Local aPergNome			:= {}
	Local aRespNome			:= {}
	Local aNomes				:= {}
	Local cLista 				:= ""
	Local nI						:= 0
	Local aPergCombo		:= {}
	Local aRespCombo		:= {}
	Local nPosNome			:= 0



	while lContinua == .T.

		aPergOpc := {}
		aRespOpc := {}
		aAdd(aPergOpc,{2,"Escolha uma das opções",1,aCombo,50,"",.T.})

		If ParamBox(aPergOpc, "Informe os parâmetros", aRespOpc)
			cEscolha := aRespOpc[1]

			If cEscolha == "1 - Adicionar nome"
				aPergNome := {}
				aRespNome := {}
				aAdd(aPergNome,{1,"Digite um nome",Space(20),"","","","",0,.T.})

				If ParamBox(aPergNome, "Processamento", aRespNome)
					aAdd(aNomes, AllTrim(aRespNome[1]))
				EndIf

			ElseIf cEscolha == "2 - Remover nome"

				If Len(aNomes) == 0
					MsgInfo("Nenhum nome cadastrado para remoção.")
					Loop
				EndIf

				aPergCombo 	:= {}
				aRespCombo 	:= {}

				aAdd(aPergCombo,{2,"Selecione o nome para remover",1, aNomes,50,"",.T.})
				If ParamBox(aPergCombo, "Exclusão de nome", aRespCombo)

					nPosNome := aRespCombo[1]
					If nPosNome > 0
						ADel(aNomes, nPosNome)
						ASize(aNomes, Len(aNomes) - 1)
						MsgInfo("Nome removido com sucesso.")

					Else
						MsgInfo("Nome não encontrado")
					EndIf

				EndIf

			ElseIf cEscolha == "3 - Listar nomes"
				cLista := ""
				nI     := 0

				If Len(aNomes) == 0
					MsgInfo("Nenhum nome cadastrado.")
					Loop
				EndIf

				For nI := 1 To Len(aNomes)
					cLista += cValToChar(nI) + " - " + aNomes[nI] + CRLF
				Next nI

				MsgInfo("Lista de nomes cadastrados:" + CRLF + cLista)
			Else
				MsgInfo("Fim do programa")
				lContinua := .F.
			EndIf

		EndIf

	EndDo

Return



