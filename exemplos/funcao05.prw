#include "Protheus.ch"

/*/-------------------------------------------------
{Protheus.doc} MenuOpcoes
Exemplo de função em ADVPL. Projeto 5 — Menu de opções
@Author     Iuri Souza
@since      15/12/2025
@Version    12/superior
------------------------------------------------------/*/

User Function MenuOpcoes()

	Local cInput      := ""
	Local cBoasVindas := "Olá, seja bem-vindo!"

	While .T.

		cInput := AllTrim(FWInputBox(;
			"Digite uma das opções abaixo:" + CRLF + ;
			"1 - Mostrar mensagem de boas-vindas" + CRLF + ;
			"2 - Informar data atual" + CRLF + ;
			"3 - Informar hora atual" + CRLF + ;
			"4 - Sair", ""))

		// Validação da opção
		If Empty(cInput) .OR. !IsDigit(cInput)
			MsgInfo("Informe uma opção numérica válida.")
			Loop
		EndIf

		If cInput == NIL
			Exit
		EndIf

		Do Case
		Case Val(cInput) == 1
			MsgInfo(cBoasVindas)

		Case Val(cInput) == 2
			MsgInfo("Data Atual: " + DToC(Date()))

		Case Val(cInput) == 3
			MsgInfo("Hora atual: " + Time())

		Case Val(cInput) == 4
			MsgInfo("Encerrando o menu.")
			Exit

		Otherwise
			MsgInfo("Opção inválida")

		EndCase

	EndDo

Return
