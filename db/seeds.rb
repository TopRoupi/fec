# frozen_string_literal: true

Category.create(name: 'iniciante')
Category.create(name: 'strings')
Category.create(name: 'matemática')
Category.create(name: 'grafos')
Category.create(name: 'paradigmas')
Category.create(name: 'geometria computacional')
Category.create(name: 'estruturas e bibliotecas')

Language.create(name: 'c#', cod: 1)
Language.create(name: 'Java', cod: 4)
Language.create(name: 'Python 3', cod: 24)
Language.create(name: 'C', cod: 6)
Language.create(name: 'C++', cod: 7)
Language.create(name: 'Php', cod: 8)
Language.create(name: 'Haskell', cod: 11)
Language.create(name: 'Ruby', cod: 12)
Language.create(name: 'Lua', cod: 14)
Language.create(name: 'Javascript', cod: 17)
Language.create(name: 'Prolog', cod: 19)
Language.create(name: 'Go', cod: 20)
Language.create(name: 'Scala', cod: 21)
Language.create(name: 'Node.js', cod: 23)
Language.create(name: 'Python3', cod: 24)
Language.create(name: 'Elixir', cod: 41)
Language.create(name: 'Ocaml', cod: 42)

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

e = Exercice.create(
  language: Language.find(5), # python
  category: Category.first,
  level: 1,
  limit_time: 1,
  limit_mem: 1,
  name: 'Soma Simples',
  content: content,
  code: "a = int(input)\n"\
  "b = int(input)\n"\
  'print("X =", a + b)'
)

tests.each do |test|
  t = Test.create test
  e.tests << t
end
