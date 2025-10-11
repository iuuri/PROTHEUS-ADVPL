#include 'protheus.ch'

/*
Analise dos tipos de dados
Autor: Iuri
Data: 15/09/2025
*/

User Function TiposDados()

//Numérico 
	Local nValor    := 10
	Local nValPF    := 15.734

//Lógico
	Local lOk       := .T.
	Local lNok      := .F.

//Caracter 
	Local cNome     := "Iuri"
	Local cTexto    := "Este é uma variável do tipo caractere"

//Data 
	Local dDataIni  := CToD("15/09/2025")
	Local dDataHohe := Date() //Data atual
	Local dData     := StoD("20250915")

//Matriz / Array 
	Local aNomes    := {"João", "Pedro", "Marcelo", "Joaquina"}
	Local aNumeros  := {1, 3, 6, 23, 49}
	Local aTodos    := {"João", StoD("20250915"), 45, .T., {1,2,3}}

//Bloco de código
	Local bBloco    := {|| nA := 1}
	Eval(bBloco) //executar o bloco de codigos


//Objeto
	Local oPessoa		:= Pessoa():New("Iuri", 27, "M")
	oPessoa:Andar()
	oPessoa
Return
