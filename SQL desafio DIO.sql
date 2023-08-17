-- criar tabela cliente
create table cliente(
idcliente int auto_increment primary key,
name varchar (10),
Minit char (3),
Lname varchar (20),
CPF char(11) not null,
Adress varchar (50),
constraint unique_cdf_client unique (CPF)4
);

--- criar tabela produto
idproduct int auto_increment primary key,
Pname varchar (30),
Minit char (3),
Lname varchar (20),
CPF char(11) not null,
Address varchar (30),
constraint unique_cpf_client unique (CPF)
);

