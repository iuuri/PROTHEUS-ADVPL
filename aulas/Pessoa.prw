#include 'Protheus.ch'

/*/{Protheus.doc} Pessoa
Classe para definicão de pessoa.
@Author Iuri Souza
@Data 19/10/2025
@Version 12/superior
/*/

Class Pessoa
	Data cNomPerson
	Data dNascimento
	Data nSaldoConta

	Method New(cNome, dDtNasc, nSaldoIni) Constructor
	Method PagarConta(nValor)

EndClass

/*/{Protheus.doc} New
Contrutor da classe
@Author Iuri Souza
@Data 19/10/2025
@Version 12/superior
/*/

Method New(cNome, dDtNasc, nSaldoIni) Class Pessoa
	::cNomPerson     := cNome
	::dNascimento    := dDtNasc
	::nSaldoConta    := nSaldoIni
Return self

/*
Metodo pagar conta
*/

Method PagarConta(nValor) Class Pessoa
	If ::nSaldoConta >= nValor
		::nSaldoConta -= nValor
		Alert("Conta paga com sucesso!")
	Else
		Alert("Saldo insuficiente. Você tem " + cValToChar(::nSaldoConta) + "e o valor a pagar é de " + cValToChar(nValor) + ".")
	EndIf
Return
