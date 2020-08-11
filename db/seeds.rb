# frozen_string_literal: true

Category.create(name: 'Iniciante')
Category.create(name: 'Strings')
Category.create(name: 'Matemática')
Category.create(name: 'Grafos')
Category.create(name: 'Paradigmas')
Category.create(name: 'Geometria computacional')
Category.create(name: 'Estruturas e bibliotecas')

Language.create(name: 'Python', cod: 71, version: '3.8.1').save!
Language.create(name: 'C', cod: 50, version: 'GCC 9.2.0')
Language.create(name: 'Ruby', cod: 72, version: '2.7.0')

tests = []

tests << {
  input: "2\n"\
         "3\n",
  output: "X = 5\n",
  visible: true
}

tests << {
  input: "-1\n"\
         "5\n",
  output: "X = 4\n",
  visible: true
}

tests << {
  input: "6\n"\
         "-10\n",
  output: "X = -4\n",
  visible: false
}

tests << {
  input: "2\n"\
         "22\n",
  output: "X = 24\n",
  visible: false
}

content = ''\
'Leia 2 valores inteiros e armazene-os nas variáveis **A** e **B**. Efetue a '\
'soma de **A** e **B** atribuindo o seu resultado na variável **X**. Imprima '\
'**X** conforme exemplo apresentado abaixo. Não apresente mensagem alguma '\
'além daquilo que está sendo especificado e não esqueça de imprimir o fim de '\
"linha após o resultado.\n"\
"\n"\
"### Entrada\n"\
"\n"\
"A entrada contém 2 valores inteiros.\n"\
"\n"\
"### Saída\n"\
"\n"\
'Imprima a mensagem "X = " (letra X maiúscula) seguido pelo valor da variável '\
'X e pelo final de linha. Cuide para que tenha um espaço antes e depois do '\
"sinal de igualdade, conforme o exemplo abaixo.\n"\
"\n"\
"| Exemplos de Entrada | Exemplos de Saída |\n"\
"| :- | :- |\n"\
"| 10<br>9 | X = 19 |\n"\
"| -10<br>4 | X = -6 |\n"

exercice = Exercice.create(
  category: Category.first,
  level: 1,
  name: 'Soma Simples',
  content: content,
)

exercice.tests_specification.update(
  language: Language.find_by(name: 'Python'),
  exercice: exercice,
  limit_time: 1,
  limit_mem: 10,
  code: "a = int(input)\n"\
  "b = int(input)\n"\
  'print("X =", a + b)'
)

tests.each do |test|
  t = Test.create test
  exercice.tests_specification.tests << t
end

exercice.tests_specification.save!


#will delete later i swear

User.create(
  name: "user",
  email: "user@user",
  password: "12345678"
)

User.create(
  name: "admin",
  email: "admin@admin",
  role: 'admin',
  password: "12345678"
)
