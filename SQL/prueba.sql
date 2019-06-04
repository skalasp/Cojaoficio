create table Informacion_Basica(
IdUsuario int primary key not null,
NumeroDocumento int not null,
IdDocumento   int not null,
Nombres varchar(255) not null,
ApellidoPaterno varchar(255) not null,
ApellidoMaterno varchar(255) not null,
Movil varchar(255) not null,
Telefono varchar(255)  null,
Email  varchar(255)  null,
Direccion varchar(255)  null,
IdCiudad int not null,
IdDepartamento int not null
);
