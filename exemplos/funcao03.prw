#include "Protheus.ch"

/*/-------------------------------------------------
{Protheus.doc} VerificaIdade
Exemplo de função em ADVPL. Projeto 3 — Verificação de idade
@Author     Iuri Souza
@since      12/12/2025
@Version    15/superior
------------------------------------------------------/*/

User Function VerificaIdade()
	Local cIdade := ""

	while .T.

		cIdade := FWInputBox("Digite a sua idade", "")

		If Empty(cIdade) .OR. !IsDigit(cIdade)
			MsgInfo ("O campo deve ser preenchido com algum valor numérico.")
			Loop
		Else
			If Val(cIdade) >= 18
				MsgInfo("A idade informada foi " + cIdade + " anos." + CRLF + "Você é maior de idade.")
			Else
				MsgInfo("A idade informada foi " + cIdade + " anos." + CRLF + "Você é menor de idade.")
			EndIf
			Exit
		EndIf
	EndDo
Return
