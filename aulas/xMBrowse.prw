#Include "Protheus.ch"

/*/{Protheus.doc} xMBrowse
Exemplo de como criar uma tela modelo 1 - crud
@autor Iuri Souza
@since 11/11/2025
@Version 12/Superior
/*/


User Function xMBrowse()

	Local cAlias      := "SZ0"
	Private cCadastro := "Carteira de Clientes"
	Private aRotina   := { }

	AAdd(aRotina, {"Pesquisar"	,"AxPesqui"	,0,1}) //1-Pesquisa
	AAdd(aRotina, {"Visualizar"	,"AxVisual"	,0,2}) //2-Visualizar
	AAdd(aRotina, {"Incluir"	,"AxInclui"	,0,3})   //3-Incluir
	AAdd(aRotina, {"Alterar"	,"AxAltera"	,0,4})   //4-Alterar
	AAdd(aRotina, {"Excluir"	,"AxDeleta"	,0,5})   //5-Excluir

	DBSelectArea(cAlias)
	DBSetOrder(1)

	mBrowse(6, 1, 22, 75, cAlias)


Return NIl
