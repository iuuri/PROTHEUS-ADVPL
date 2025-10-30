#Include "Protheus.ch"

/*/{Protheus.doc} SQLExe01
Aula 01 sobre SQL com ADVPL

@author Iuri Souza
@since 30/10/2025
@version 12/Superior
/*/
User Function SQLExe01()
    Local cQuery        := ""
    Local cAliasTop     := ""

    cQuery := "SELECT " + CRLF
    cQuery += "	A1_COD " + CRLF
    cQuery += "	, A1_LOJA " + CRLF
    cQuery += "	, A1_NOME " + CRLF
    cQuery += "	, A1_LC " + CRLF
    cQuery += "	, CAST(A1_VENCLC AS DATE) VENCLC " + CRLF
    cQuery += "	, C5_NUM " + CRLF
    cQuery += "	, CAST(C5_EMISSAO AS DATE) EMISSAO_PV " + CRLF
    cQuery += "	, SUM(C6_VALOR) VALOR_PV " + CRLF
    cQuery += "FROM " + RetSQLName("SC5") + " SC5 " + CRLF
    cQuery += "	INNER JOIN " + RetSQLName("SC6") + " SC6 " + CRLF
    cQuery += "		ON SC6.D_E_L_E_T_ = ' ' " + CRLF
    cQuery += "		AND C6_FILIAL = C5_FILIAL " + CRLF
    cQuery += "		AND C6_NUM = C5_NUM " + CRLF
    cQuery += "	INNER JOIN " + RetSQLName("SA1") + " SA1 " + CRLF
    cQuery += "		ON SA1.D_E_L_E_T_ = ' ' " + CRLF
    cQuery += "		AND A1_FILIAL = '" + xFilial("SA1") + "' " + CRLF
    cQuery += "		AND A1_COD = C5_CLIENTE " + CRLF
    cQuery += "		AND A1_LOJA = C5_LOJACLI " + CRLF
    cQuery += "WHERE " + CRLF
    cQuery += "SC5.D_E_L_E_T_ = ' ' " + CRLF
    cQuery += "AND C5_FILIAL = '" + xFilial("SC5") + "' " + CRLF
    cQuery += "GROUP BY " + CRLF
    cQuery += "	A1_COD " + CRLF
    cQuery += "	, A1_LOJA " + CRLF
    cQuery += "	, A1_NOME " + CRLF
    cQuery += "	, A1_LC " + CRLF
    cQuery += "	, A1_VENCLC " + CRLF
    cQuery += "	, C5_NUM " + CRLF
    cQuery += "	, C5_EMISSAO " + CRLF
    cAliasTop := MPSysOpenQuery(cQuery)

    While (cAliasTop)->(!EOF())
        //Tratativa
        If (cAliasTop)->A1_LC >= (cAliasTop)->VALOR_PV
            Alert("Pode liberar, cliente tem crédito!")
        Else
            Alert("Cliente sem crédito para este valor de pedido: Valor PV = " + cValToChar((cAliasTop)->VALOR_PV) + " e LC = " +;
            cValToChar((cAliasTop)->A1_LC) )
        EndIf

        U_SQLExe02((cAliasTop)->A1_COD, (cAliasTop)->A1_LOJA)
        
        (cAliasTop)->(DbSkip())
    EndDo

    (cAliasTop)->(DbGoTop()) //SA1->(DbGoTop())

    (cAliasTop)->(DbCloseArea())

Return
