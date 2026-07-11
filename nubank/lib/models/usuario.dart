import 'package:nubank/models/carteira.dart';

class Usuario {
  String _nome;
  int _idade;
  Carteira _carteira;

  Usuario(this._nome, this._idade, this._carteira);

  Carteira get carteira => _carteira;

  set carteira(Carteira value) {
    _carteira = value;
  }

  int get idade => _idade;

  set idade(int value) {
    _idade = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }
}
