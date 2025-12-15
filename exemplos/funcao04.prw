#include "Protheus.ch"

/*/-------------------------------------------------
{Protheus.doc} LoopContagem
Exemplo de função em ADVPL. Projeto 4 — Loop de Contagem (1 até N)
@Author     Iuri Souza
@since      15/12/2025
@Version    15/superior
------------------------------------------------------/*/

User Function LoopContagem()

	Local cValor  := 0
	Local nContador  := 0

	while .T.

		cValor  := FWInputBox("Digite um numero inteiro: ", "")

		If Empty(cValor) .OR. !IsDigit(cValor)

			MsgInfo("O campo deve ser preenchido com algum valor numérico inteiro.")
			Loop

		Else

			For nContador := 1 To Val(cValor)
				MsgInfo("Posição atual: " + cValToChar(nContador))
			Next nContador
			MsgInfo("Fim de contagem.")

			Exit

		EndIf

	EndDo

Return
