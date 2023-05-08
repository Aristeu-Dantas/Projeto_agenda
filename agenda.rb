@agenda = [
	{nome: "Diego", telefone: "99993333"},
	{nome: "Fulano", telefone: "88883333"}
]

def todos_contatos
	@agenda.each do |contato|
		puts "#{contato[:nome]} - #{contato[:telefone]}"
	end
	puts "_________________________________________"
end

def adicionar_contato
	print "Nome: "
	nome = gets.chomp
	print "Telefone: "
	telefone = gets.chomp

	@agenda << {nome: nome, telefone: telefone}
end

def ver_contato
	print "Qual nome você deseja: "
	nome = gets.chomp

	@agenda.each do |contato|
		if contato[:nome].downcase.include?(nome.downcase)
			puts "#{contato[:nome]} - #{:telefone}"
		end
	end
end	

def editar_contato
	print "Qual o nome deseja editar: "
	nome=gets.chomp

	@agenda.each do |contato|
		if contato[:nome].downcase==(nome.downcase)
			print "Nome para editar: "
			nome_salvo=contato[:nome]

			contato[:nome]=gets.chomp
			contato[:nome]=contato[:nome].empty? ? nome_salvo : contato[:nome]

			print "Telefone para editar: "
			telefone_salvo=contato[:telefone]

			contato[:telefone]=gets.chomp
			contato[:telefone]=contato[:telefone].empty? ? nome_salvo : contato[:telefone]
		end
	end
end

def	remover_contato
	print "Qual contato quer remover: "
	nome = gets.chomp

	@agenda.each do |contato|
		if contato[:nome].downcase == (nome.downcase)
			indice = @agenda.index(contato)
			@agenda.delete_at(indice)
			break
		end
	end			
end

loop do
	puts "1. Contatos\n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
	codigo=gets.chomp.to_i

	case codigo
	when 0
		puts "Até mais!"
		break
	when 1
		todos_contatos
	when 2
		adicionar_contato
	when 3
		ver_contato
	when 4
		editar_contato
	when 5
		remover_contato
	end
	else
		puts "Função não existe, por favor use uma função válida"
end
