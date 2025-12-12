#include "Protheus.ch"

/*/-------------------------------------------------
{Protheus.doc} funcao02
Exemplo de função em ADVPL. Projeto 2 — Calculadora simples
@Author     Iuri Souza
@since      12/12/2025
@Version    15/superior
------------------------------------------------------/*/
User Function funcao02()
	Local nNum1 := 0
	Local nNum2 := 0


	// Solicita o primeiro numero
	nNum1 := Val(FWInputBox("Digite o primeiro número: ", ""))
	// Solicita o segundo numero
	nNum2 := Val(FWInputBox("Digite o segundo número: ", ""))

	Local nSoma   := nNum1 + nNum2
	Local nSub    := nNum1 - nNum2
	Local nMult   := nNum1 * nNum2
	Local nDiv    := 0
	Local cAlerta := "O segundo número deve ser diferente de 0"

	If nNum2 != 0
		nDiv := nNum1 / nNum2
	Else
		nDiv := cAlerta
	EndIf

	MsgInfo("O resultado de cada operação é:" + CRLF +;
		"Soma: " + cValToChar(nSoma) + CRLF +;
		"Subtração: " + cValToChar(nSub) + CRLF +;
		"Multiplicação: " + cValToChar(nMult) + CRLF +;
		"Divisão: " + cValToChar((nDiv)))

Return
