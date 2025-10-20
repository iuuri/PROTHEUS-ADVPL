#include 'Protheus.ch'

/*
xDataValida.prw
Static function com calculo auxiliar
Autor: Iuri Souza
Data: 16/10/2025
*/

Static Function lEFeriado(dData, aFeriados)

	Local nX
	For nX := 1 TO Len(aFeriados)
		If aFeriados[nX,1] == dData
			Return .T.
		EndIf
	Next

return .F.



/*
xDataValida.prw
Fun��o que valida uma data e informa o proximo dia �til
Autor: Iuri Souza
Data: 16/10/2025
*/

User Function DiaUtil()

	Local aPergs 			:= {}
	Local aResps 			:= {}
	Local aOpcoes 			:= {"Proximo dia �til", "Dia �til anterior"}
	Local dData 			:= Date()
	Local nOpcao 			:= 1
	Local aFeriados 		:= {}
	Local cResultado 		:= ""


	// Cria array de feriados 2025
	aFeriados := { ;
		{CTOD("01/01/2025"), "Confraterniza��o Universal"}, ;
		{CTOD("03/03/2025"), "Carnaval"}, ;
		{CTOD("04/03/2025"), "Carnaval"}, ;
		{CTOD("18/04/2025"), "Sexta-feira Santa"}, ;
		{CTOD("21/04/2025"), "Tiradentes"}, ;
		{CTOD("01/05/2025"), "Dia do Trabalho"}, ;
		{CTOD("19/06/2025"), "Corpus Christi"}, ;
		{CTOD("07/09/2025"), "Independ�ncia do Brasil"}, ;
		{CTOD("12/10/2025"), "Nossa Senhora Aparecida"}, ;
		{CTOD("02/11/2025"), "Finados"}, ;
		{CTOD("15/11/2025"), "Proclama��o da Rep�blica"}, ;
		{CTOD("25/12/2025"), "Natal"} ;
		}

	//Perguntas

	// aAdd(aPergs, {1, "Informe a data", dData,,,,,50,.T.})
	aAdd(aPergs, {1, "Informe a data", SToD(""), "", "", "", "", 50, .T.})
	aAdd(aPergs, {2,"Escolha uma op��o", "Proximo dia �til", aOpcoes, 50, "",.T.})



	If Parambox(aPergs, "Verifica��o de dia �til", @aResps)
		dData := aResps[1]
		nOpcao := aResps[2]

		// Enquanto for sab, dom ou fer
		While (Dow(dData) == 1) .OR. (Dow(dData) == 7) .OR. (lEFeriado(dData, aFeriados))
			If nOpcao == "Proximo dia �til"
				dData := dData + 1
			else
				dData := dData - 1
			EndIf
		EndDo

		cResultado := "O dia �til correspondente �: " +  DTOC(dData) +"."
		Alert(cResultado)

	EndIf

Return

