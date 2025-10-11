#include 'Protheus.ch'

/*------------------------------------------------------------------
{Protheus.doc} Ex001
Exemplo de fun��o de usaurio em ADVPL
@author     Iuri Souza
@since      27/09/2025
@version    12/superior
------------------------------------------------------------------*/

User Function Ex001(nNum1, nNum2, cTpOper)

    Local nResultado    := 0
    Default nNum1       := 0
    Default nNum2       := 0
    Default cTpOper     := ""

    if !Empty(cTpOper)
        if cTpOper == "Soma"
            nResultado := nNum1 + nNum2
        endif
    EndIf

Return nResultado


/*------------------------------------------------------------------
{Protheus.doc} Ex001A
Exemplo de fun��o est�tica em ADVPL
@author     Iuri Souza
@since      27/09/2025
@version    12/superior
------------------------------------------------------------------*/

Static Function Ex001A()
    
    Local nNumero2  := 10
    
Return 

/*------------------------------------------------------------------
{Protheus.doc} Ex002
Exemplo de fun��o de usaurio em ADVPL
@author     Iuri Souza
@since      27/09/2025
@version    12/superior
------------------------------------------------------------------*/

User Function Ex002(nNumEnv)

    //Declara��o de variaveis 
    Local nNumero       := 5
    Default nNumEnv     := 0

    if nNumEnv > nNumero
        Alert("� maior")
    else
        Alert("� igual ou menor")
    endif

    Ex001A()
Return
