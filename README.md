		Monta grade!
===================
Aplicação que monta todas as grades possíveis de acordo com as matérias selecionadas. Evita aquela dor de cabeça com planilhas a cada início de semestre ¯\_(ツ)_/¯

*OBS: Inicialmente baixando as páginas via shell script, mas a ideia é passar tudo para Java.

----------

**Front End**

O objetivo é criar uma aplicação(talvez web, mas possivelmente não) em que o usuário entre com os códigos das matérias(944, 4386...) e gerar TODAS as grades possíveis.

Opção de selecionar horários livres para outras atividades(gerar grade que não conflita com os tempos selecionados)

Opção de selecionar turmas somente no turno da manhã OU em um intervalo de tempo(Ex.: matérias com turmas que comecem as 7h ou 18h)

Ex:
![Grade quadradona no Aluno Online](https://github.com/jgfenix/monta_grade/blob/master/examples/exemplo_grade.png)
*Grade quadradona no Aluno Online*


----------


**Back End**

Uma outra aplicação a parte irá baixar as páginas em html, extrair as informações das turmas e enviá-las para um banco de dados.

A aplicação final deverá baixar o banco de dados quando houver atualização do mesmo.

