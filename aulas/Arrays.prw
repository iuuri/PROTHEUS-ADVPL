#Include "Protheus.ch"

/*/Arrays
Fun��o para explicar sobre array e matriz

@author Iuri Souza
@since 11/10/2025
@version 12/superior
/*/
User Function Arrays()

	Local nTam      := 0
	Local nPos      := 0
	Local cConteudo := ""
	Local aConteudo := {}
	//Como declarar array
	//A vari�vel do tipo array deve ser iniciada com a letra a.
	//Existem 5 formas de inicializar um array

	//1- Para inicializar um array vazio, basta abri e fechar chaves
	Local aNumeros  := {}

	//2 - Para inicializar um array preenchido, basta separar seus elementos com a v�rgula
	Local aCores    := {"Verde", "Amarelo", "Azul", "Branco"}
	//O array pode conter elemetos de tipos diferentes de dados
	Local aPessoa   := {"Jo�o", CToD("01/06/1979"), 1.87, .T., {"Coordenador de TI","Analista Protheus", "Dev. S�nior"}, {|| u_teste}, NIL}

	//3- Usando a fun��o Array(). O conte�do padr�o � Nil
	Local aTitulos  := Array(5, Space(10))
	//Na fun��o Array(), se os par�metros forem passados como n�meros, a fun��o vai criar um array multidimensional.
	Local aTabela   := Array(2, 4, Space(05))

	//4- Recebendo a refer�ncia de outro array
	Local aCores2   := aCores

	//5- Recebendo uma c�pia de outro array
	Local aCores3   := AClone(aCores)

	Local aExemplo  := {}
	Local aBkp      := {}

	//Para saber o tamanho de um array, usa-se a fun��o Len()
	nTam := Len(aTabela)
	nTam := Len(aTabela[1])

	//Para pegar o conte�do de um array, deve-se informar o �ndice. O array inicia na posi��o de n�mero 1
	cConteudo := aCores[1]
	cConteudo := aCores[2]
	//Se uma posi��o n�o existente do array for invocada, o sistema responder� com o erro 'Array out of bounds'
	//cConteudo := aCores[5]

	//Se foi usada a c�pia de um array por refer�ncia, os 2 arrays alteram o mesmo conte�do
	Alert(aCores[2])
	aCores2[2] := "Marrom"
	Alert(aCores2[2] + "," + aCores[2])

	Alert(aCores[3])
	aCores3[3] := "Prata"
	Alert(aCores3[3] + "," + aCores[3])

	//Para adicionar itens num array, existem 3 formas
	//1 - Passado acima, acessar a posi��o do array de forma literal e adicionar o dado
	aTabela[1][1] := "Abacaxi"
	aTabela[1][2] := 10.00
	aTabela[1][3] := "Unidade"
	aTabela[1][4] := CToD("25/04/2023")

	aTabela[2][1] := "Morango"
	aTabela[2][2] := 8.00
	aTabela[2][3] := "Caixa"
	aTabela[2][4] := CToD("25/04/2023")

	//2 - Usando a fun��o AAdd
	AAdd(aTabela, {"Banana", 7.00, "Quilo", CToD("25/04/2023")})
	AAdd(aTabela, {"Melancia", 20.00, "Unidade", CToD("25/04/2023")})
	AAdd(aTabela, {"Kiwi", 20.00, "Caixa", CToD("25/04/2023")})
	AAdd(aTabela, {"Banana", 9.00, "Quilo", CToD("25/04/2023")})
	AAdd(aTabela, {"Kiwi", 18.00, "Caixa", CToD("25/04/2023")})
	aAdd(aNumeros, 300)
	aAdd(aNumeros, 100)
	aAdd(aNumeros, 200)

	//Para saber o conte�do da �ltima posi��o do array
	cConteudo := ATail(aCores)
	cConteudo := aCores[Len(aCores)]
	aConteudo := ATail(aTabela)
	cConteudo := ATail(aTabela[1])

	//Para localizar a posi��o de um dado no array
	nPos := aScan(aCores, "Branco")
	nPos := aScan(aNumeros, 200)
	//Para localizar a posi��o num array multidimensional
	nPos := aScan(aTabela, {|x| x[1] == "Banana"})
	nPos := aScan(aTabela, {|x| x[3] == "Caixa"})

	//Ordenar os itens do array
	//Se for de uma dimens�o
	ASort(aNumeros)

	//Se for multidimensional
	ASort( aTabela, , ,{ |x,y| x[1] < y[1] } )
	ASort( aTabela, , ,{ |x,y| x[1] < y[1] .Or. ( x[1] == y[1] .And. x[2] < y[2] ) } )

	//Existem outras fun��es para manipula��o de posi��es espec�ficas do array
	//Quais os usos mais comuns de arrays?

	//Outra forma de replicar um array
	aExemplo    := {1, 2, {11, 22, 33}}
	aBkp        := {, , {, , }}
	ACopy(aExemplo, aBkp)
	aBkp        := {}
	ACopy(aExemplo, aBkp)

	//Deleta um elemento do array
	ADel(aExemplo,2)

	//Aumenta ou diminui o tamanho de um array
	ASize(aExemplo,2)
	aExemplo := {1, 2, 3, 4}
	ASize(aExemplo,5)
	ASize(aExemplo,2)

	//Preenche um array com qualquer tipo de dado
	aExemplo := Array(10)
	AFill(aExemplo,"carro",/*nStart*/,/*nCount*/)
	AFill(aExemplo,10,5)
	AFill(aExemplo,.T.,7,2)

	//Inclui um elemento nulo na posi��o definida e 'empurra' os demais para frente descartando o �ltimo elemento.
	aExemplo := {1, 2, 3, 4,5,6}
	AIns(aExemplo,3)
	AIns(aExemplo,1)
	AIns(aExemplo,2)

	//Procurar um valor no array com AScanX
	aExemplo := {}
	AAdd( aExemplo, "Banana" )
	AAdd( aExemplo, "Ma��" )
	AAdd( aExemplo, "P�ra" )
	AAdd( aExemplo, "Lim�o" )
	AAdd( aExemplo, "Abacaxi" )
	AAdd( aExemplo, "Laranja" )
	AAdd( aExemplo, "Mam�o" )
	AAdd( aExemplo, "Graviola" )

	nPos := AScanX(  aExemplo, { | x, y | x == "Abacaxi" .And. y <= 1 } )
	nPos := AScanX(  aExemplo, { | x, y | x == "Abacaxi" .And. y <= 5 } )
	nPos := AScanX(  aExemplo, { | x, y | x == "Abacaxi" .And. y <= 6 }, 2 )
	nPos := AScanX(  aExemplo, { | x, y | x== "Abacaxi" .And. y <= 6 }, 1, 4 )
	nPos := AScanX(  aExemplo, { | x, y | x == "Abacaxi" .And. y <= 8 }, 6)

Return
