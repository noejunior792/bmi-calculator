import 'package:flutter_test/flutter_test.dart';
import 'package:dio_imcdart/pessoa.dart';

void main() {
  test('Calcula o IMC corretamente', () {
    Pessoa pessoa = Pessoa(nome: 'Teste', peso: 70, altura: 1.75);
    expect(pessoa.calcularIMC(), closeTo(22.86, 0.01));
  });
}
