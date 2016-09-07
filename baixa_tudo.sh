#!/bin/bash

#TODO: excluir materias com "Nenhum registro", ou seja, nenhuma turma disponivel. Ex 12985.html

export LANG=C.UTF-8
arq_temp="/tmp/temporario.txt" #arquivo temporario para extrair a parte util da página

while read linha ; do
	echo "baixando ${linha%%.*}" #lendo do arquivo relacao_materias.txt
								 #linhas no formato "nome.html"
	wget --reject=gif "https://www.alunoonline.uerj.br/requisicaoaluno/requisicao.php?requisicao=DadosDisciplina&disciplinas[0]=${linha%%.*}" -O "./materias/${linha%%.*}.html" -q
	
	# INICIO # encontra o conteúdo útil da página
	count=1
	while IFS='' read -r line || [[ -n "$line" ]]; do
		if [[ "$line" =~ "Requisitos Exigidos" ]]; then
			# echo "linha $count"
			inicio=$count
		fi
		#TODO: ENCONTRAR UM JEITO DE CORTAR A TABELA DE PRÉ-REQUISITOS 
		# if [[ "$line" =~ "Grupo" ]]; then
		# 	echo "linha $count"
		# 	inicio=$((count-1))
		# fi
		if [[ "$line" =~ "<!--  FINAL" ]]; then
			# echo "linha $count"
			final=$count
		fi
		count=$((count+1))
	done < "./materias/${linha%%.*}.html"
	count=1
	# FIM # encontra o conteúdo útil da página
	echo "Cortando arquivo html"

	# echo /dev/null > "$arq_temp"
	inicio=$((inicio+1))
	for (( i=$inicio; i < $final; i++ )); do
	awk "NR==$i" "./materias/${linha%%.*}.html" >> "$arq_temp"
	done
	echo "Movendo arquivo html"
	mv "$arq_temp" "./materias/${linha%%.*}.html"

	# python request.py materias/${linha%%.*}.html > /tmp/teste/${linha}.html

done < "relacao_materias.txt"
