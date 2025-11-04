#Include "Protheus.ch"

/*/{Protheus.doc} SQLExe02
Aula 02 sobre SQL com ADVPL
@version 12/Superior
/*/
User Function SQLExe02(cCodCli, cLojCli)

    Local aArea     := GetArea()
    Local aSA1      := SA1->(GetArea())

    //ChkFile("SZ0") //João usa esse para abrir uma tabela que porventura esteja fechada
    //DbSelectArea("SA1") //João não usa! Para abrir uma área que porventura pode estar fechada 
    
    //DbCloseArea("SA1") //João só usa para fechar áreas de queries
    SA1->(DbSetOrder(1))
    If SA1->(DbSeek(xFilial("SA1") + cCodCli + cLojCli))
        Alert("Achei o cliente" + AllTrim(SA1->A1_NOME))
        SA3->(DbSetOrder(1))
        If SA3->(DbSeek(xFilial("SA3") + SA1->A1_VEND))
            Alert("Achei o vendedor "+ AllTrim(SA3->A3_NOME))
        EndIf
    EndIf

    RestArea(aSA1)
    RestArea(aArea)
Return
