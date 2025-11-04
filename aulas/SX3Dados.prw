#INCLUDE "Protheus.ch"

/*/{Protheus.doc}
Classe para uso de dados SX3 de um campo
/*/

CLASS SX3Dados
	DATA cTabela
    DATA cCampo
	DATA cTitulo
    DATA nTamanho
    DATA nDecimal
    DATA lUsado
	DATA cPicture
	DATA cFolder
	DATA lTrigger

    METHOD New(cCampo) CONSTRUCTOR

ENDCLASS 

/*/{Protheus.doc} New
    (Método construtor da classe)
    @param cCampo 
    @return self, Object, Retorna um objeto com atributos da SX3 do campo informado
/*/
METHOD New(cCampo) CLASS SX3Dados
	Local aArea		:= GetArea()
	Local aSXA		:= SXA->(GetArea())
	Local cQuery	:= ""
	Local cAliasTop	:= ""

	cCampo := Upper(cCampo)
	
	cQuery := "	SELECT X3_CAMPO " + CRLF
	cQuery += "	FROM " + RetSQLName("SX3") + " SX3 " + CRLF
	cQuery += "	WHERE " + CRLF
	cQuery += "	X3_CAMPO = '" + cCampo + "' " + CRLF
	cAliasTop := MPSysOpenQuery(cQuery)

	If ! (cAliasTop)->(EOF())
		::cTabela	:= GetSx3Cache(cCampo,"X3_ARQUIVO")
		::cCampo	:= AllTrim(GetSx3Cache(cCampo,"X3_CAMPO"))
		::cTitulo	:= AllTrim(GetSx3Cache(cCampo,"X3_TITULO"))
		::nTamanho	:= GetSx3Cache(cCampo,"X3_TAMANHO")
		::nDecimal	:= GetSx3Cache(cCampo,"X3_DECIMAL")
		::lUsado	:= X3Usado(cCampo)
		::cPicture	:= AllTrim(GetSx3Cache(cCampo,"X3_PICTURE"))
		::cFolder	:= GetSx3Cache(cCampo,"X3_FOLDER")
		::lTrigger	:= GetSx3Cache(cCampo,"X3_TRIGGER") == "S"

		SXA->(DBSetOrder(1))
		If SXA->(DbSeek(::cTabela + ::cFolder))
			::cFolder := AllTrim(SXA->XA_DESCRIC)
		EndIF

		RestArea(aSXA)
	Else
		Help(,,"Não existe",,"O campo " + cCampo + " solicitado não existe!", 1, 0,,,,,.F.,{"Informe o nome do campo corretamente."})
		::cTabela	:= ""
		::cCampo	:= ""
		::cTitulo	:= ""
		::nTamanho	:= 0
		::nDecimal	:= 0
		::lUsado	:= .F.
		::cPicture	:= ""
		::cFolder	:= ""
		::lTrigger	:= .F.
	EndIf

	RestArea(aArea)

RETURN Self
