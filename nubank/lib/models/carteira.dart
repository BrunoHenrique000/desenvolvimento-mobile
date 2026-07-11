class Carteira {
  double _saldo;
  double _fatura;
  double _limite;
  double _emprestimo;

  Carteira(this._saldo, this._fatura, this._limite, this._emprestimo);

  double get saldo => _saldo;

  set saldo(double value) {
    _saldo = value;
  }

  double get fatura => _fatura;

  set fatura(double value) {
    _fatura = value;
  }

  double get limite => _limite;

  set limite(double value) {
    _limite = value;
  }

  double get emprestimo => _emprestimo;

  set emprestimo(double value) {
    _emprestimo = value;
  }
}
