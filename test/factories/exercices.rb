# frozen_string_literal: true

FactoryBot.define do
  factory :exercice do
    association :category
    tests_specification { build(:tests_specification, exercice: nil) }
    name { "Soma Simples" }
    level { 1 }
    content {
      ""\
      "Leia 2 valores inteiros e armazene-os nas variáveis **A** e **B**. Efetue a "\
      "soma de **A** e **B** atribuindo o seu resultado na variável **X**. Imprima "\
      "**X** conforme exemplo apresentado abaixo. Não apresente mensagem alguma "\
      "além daquilo que está sendo especificado e não esqueça de imprimir o fim de "\
      "linha após o resultado.\n"\
      "\n"\
      "### Entrada\n"\
      "\n"\
      "A entrada contém 2 valores inteiros.\n"\
      "\n"\
      "### Saída\n"\
      "\n"\
      'Imprima a mensagem "X = " (letra X maiúscula) seguido pelo valor da variável '\
      "X e pelo final de linha. Cuide para que tenha um espaço antes e depois do "\
      "sinal de igualdade, conforme o exemplo abaixo.\n"\
      "\n"\
      "| Exemplos de Entrada | Exemplos de Saída |\n"\
      "| :- | :- |\n"\
      "| 10<br>9 | X = 19 |\n"\
      "| -10<br>4 | X = -6 |\n"
    }
  end
end
