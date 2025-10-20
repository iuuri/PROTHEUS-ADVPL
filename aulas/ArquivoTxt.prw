#include "Protheus.ch"

/*/{Protheus.doc} ArquivoTxt
Exemplo de função para ler e escrever em arquivos txt.
@Author Iuri Souza 
@Date 20/10/2025
@Version 12/Superior
/*/

User Function ArquivoTxt()

	Local aPergs    := {}
	Local aResps    := {}
	Local cTitulo   := "Operar Arquivo TXT"
	Local cArquivo  := ""

	aAdd(aPergs, {6, "Informe o Arquivo: ", "", "", "", "", 80, .F.,"Arquivos .TXT|*.TXT", "", GETF_LOCALHARD+GETF_NETWORKDRIVE})

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
@Date 20/10/2025
/*/
Static Function xReadArq(cArquivo)

	Local nHandle := -1
	Local cLinha  := ""

	nHandle := ft_fUse(cArquivo)
	If nHandle > 0
		while ! ft_fEOF()
			cLinha := ft_fReadLn()

			ft_fSkip()
		EndDo
	EndIf

	//Fechar o arquivo ao finalizar o programa
	fclose(nHandle)
Return
