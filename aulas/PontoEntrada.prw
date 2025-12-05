#Include "Protheus.ch"

/*/{Protheus.doc} PontoEntrada
Aula sobre pontos de entrada

MA410MNU
A410CONS
MA410COR
MA410LEG
M410LIOK
MT410TOK
MAAVCRED
COMO BLOQUEAR UM PEDIDO POR REGRA
M410STTS
@author Iuri Souza
@since 13/11/2025
/*/
User Function MA410MNU()
    /*/---------------------------------------------------
	Parametros do array a Rotina:
	1. Nome a aparecer no cabecalho
	2. Nome da Rotina associada
	3. Reservado
	4. Tipo de Transação a ser efetuada:
	1 - Pesquisa e Posiciona em um Banco de Dados
	2 - Simplesmente Mostra os Campos
	3 - Inclui registros no Bancos de Dados
	4 - Altera o registro corrente
	5 - Remove o registro corrente do Banco de Dados
	5. Nivel de acesso
	6. Habilita Menu Funcional
    ---------------------------------------------------/*/
	aadd(aRotina,{'Nova Rotina','U_xTst001()' , 0 , 2,0,.F.})

Return

User Function xTst001()
	Alert(SC5->C5_FILIAL + '-' + SC5->C5_NUM )
Return
