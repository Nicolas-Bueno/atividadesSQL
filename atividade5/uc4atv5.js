use uc4;

db.funcionario.insertOne({
nome: "Sílvio Cortês",
telefone: "99 7898-1234",
cpf: "84537768061",
cargo: {
descricao: "Vendedor",
salario: "2500",
comissao: "10"
},
usuario: {
login: "silvioc",
senha: "sil123",
ultimo_login: "2022-01-10 10:00:00"
}
});

db.funcionario.insertOne({
nome: "Amaro Valadão",
telefone: "99 7898-1234",
cpf: "03074142057",
cargo: {
descricao: "Vendedor",
salario: "2500",
comissao: "10"
},
usuario: {
login: "amarov",
senha: "ama123",
ultimo_login: "2022-01-10 10:00:00"
}
})

db.funcionario.insertOne({
nome: "Marcos Valadão",
telefone: "99 7534-7897",
cpf: "40967947081",
cargo: {
descricao: "Vendedor",
salario: "2500",
comissao: "10"
},
usuario: {
login: "marcosv",
senha: "mar123",
ultimo_login: "2022-01-10 10:00:00"
}
})

db.funcionario.insertOne({
nome: "Domingas Souza Sá",
telefone: "99 7534-1234",
cpf: "51077408048",
cargo: {
descricao: "Supervisor de Vendas",
salario: "2800",
comissao: "10"
},
usuario: {
login: "domingass",
senha: "dom123",
ultimo_login: "2022-01-10 10:00:00"
}
})

db.funcionario.insertOne({
nome: "Marina Frazão",
telefone: "99 7589-1854",
cpf: "21788502000",
cargo: {
descricao: "Gerente",
salario: "5000",
comissao: null
},
usuario: {
login: "marinaf",
senha: "mar123",
ultimo_login: "2022-01-10 10:00:00"
}
})

db.funcionario.insertOne({
nome: "Joana Freitas",
telefone: "99 7589-7534",
cpf: "85690938025",
cargo: {
descricao: "Serviços Gerais",
salario: "1500",
comissao: null
},
usuario: {
login: "joanaf",
senha: "joa123",
ultimo_login: "2022-01-10 10:00:00"
}
})

db.funcionario.insertOne({
nome: "Aparício Dias",
telefone: "99 7514-7884",
cpf: "14131448025",
cargo: {
descricao: "Serviços Gerais",
salario: "1500",
comissao: null
},
usuario: {
login: "apariciod",
senha: "apa123",
ultimo_login: "2022-01-10 10:00:00"
}
})

db.funcionario.insertOne({
nome: "Filomena da Luz",
telefone: "99 7584-7884",
cpf: "19641782070",
cargo: {
descricao: "Estoquista",
salario: "2000",
comissao: null
},
usuario: {
login: "filomenal",
senha: "fil123",
ultimo_login: "2022-01-10 10:00:00"
}
})

// upadate 
db.funcionario.updateOne(
    { "nome" : "Joana" },
    { $set: { "telefone" : "99999999999"} }
);

// Busca funcionario por nome
db.funcionario.find({nome: "Joana Freitas"})

// Busca funcionario por cargo
db.funcionario.find({"cargo.descricao":"Estoquista"})

