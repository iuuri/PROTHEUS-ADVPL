#include 'Protheus.ch'
/*
xDataValida.prw
Função que valida uma data e informa o proximo dia útil
Autor: Iuri Souza
Data: 16/10/2025
*/

User Function DiaUtil()

	Local aPergs 			:= {}
	Local aResps 			:= {}
	Local aOpcoes 		:= {"Proximo dia útil", "Dia útil anterior"}
	Local dData 			:= Date()
	Local nOpcao 			:= 1
	Local aFeriados 	:= {}
	Local cResultado 	:= ""


	// Cria array de feriados 2025
	aFeriados := { ;
		{CTOD("01/01/2025"), "Confraternização Universal"}, ;
		{CTOD("03/03/2025"), "Carnaval"}, ;
		{CTOD("04/03/2025"), "Carnaval"}, ;
		{CTOD("18/04/2025"), "Sexta-feira Santa"}, ;
		{CTOD("21/04/2025"), "Tiradentes"}, ;
		{CTOD("01/05/2025"), "Dia do Trabalho"}, ;
		{CTOD("19/06/2025"), "Corpus Christi"}, ;
		{CTOD("07/09/2025"), "Independência do Brasil"}, ;
		{CTOD("12/10/2025"), "Nossa Senhora Aparecida"}, ;
		{CTOD("02/11/2025"), "Finados"}, ;
		{CTOD("15/11/2025"), "Proclamação da República"}, ;
		{CTOD("25/12/2025"), "Natal"} ;
		}

	//Perguntas
	aAdd(aPergs, (1, "Informe a data"), dData,,,,,50,.T. )
Return

