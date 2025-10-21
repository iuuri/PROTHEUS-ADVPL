#include "Protheus.ch"

/*/{Protheus.doc} ArquivoTxt
Exemplo de função para ler e escrever em arquivos csv.
@Author Iuri Souza 
@Date 21/10/2025
@Version 12/Superior
/*/

User Function ArquivoCsv()

	Local aPergs    := {}
	Local aResps    := {}
	Local cTitulo   := "Operar Arquivo TXT"
	Local cArquivo  := ""

	aAdd(aPergs, {6, "Informe o Arquivo: ", "", "", "", "", 80, .F.,"Arquivos .CSV|*.CSV", "", GETF_LOCALHARD+GETF_NETWORKDRIVE})

	If Parambox(aPergs, cTitulo, @aResps)
		cArquivo := allTrim(aResps[1])
		If File(cArquivo)
			xReadArq(@cArquivo)
		else
			Help(,, 'Atenção',,"Caminho do arquivo a ser importado é invalido.", 1, 0,,,,,.F.,{"Verifique se o arquivo corretoestá na pasta"})
		EndIf
	EndIf
Return


/*/{Protheus.doc} xReadArq 
Leitura do arquivo de dados 
@Author Iuri Souza
@Date 21/10/2025
/*/
Static Function xReadArq(cArquivo)

	Local nHandle 		:= -1
	Local cLinha  		:= ""
	Local aDados			:= {}
	Local aCabec			:= {}
	Local lLinPrim 		:= .T.

	nHandle := ft_fUse(cArquivo)
	If nHandle > 0
		while ! ft_fEOF()
			cLinha := ft_fReadLn()
			If lLinPrim
				aCabec := Separa(cLinha, ";")
				lLinPrim := .F.
			Else
				aDados := Separa(cLinha,";")
				xProcessa(aDados)
			EndIf
			ft_fSkip()
		EndDo
	EndIf

	//Fechar o arquivo ao finalizar o programa
	fclose(nHandle)
Return

/*/{Protheus.doc} xProcessa
Processamento das linhas e colunas do arquivo csv
@Author Iuri Souza
@Date 21/10/2025
/*/

Static Function xProcessa(aDados)
	//Nome;Idade;Cargo;Setor
	Local cNome		:= Upper(u_xNoAcento(aDados[1]))
	Local nIdade	:= Val(aDados[2])
	Local cCargo	:= Upper(u_xNoAcento(aDados[3]))
	Local Setor		:= Upper(u_xNoAcento(aDados[4]))
	Local dDtAdm	:= CToD(aDados[5])

Return
