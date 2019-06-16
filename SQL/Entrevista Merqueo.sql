drop database entrevista;


/********************************************************************************************************************************************************************************************************************
*****************************************************************************          Creacion Base de Datos        ***********************************************************************************************
********************************************************************************************************************************************************************************************************************/


create database Entrevista;
use  Entrevista;


create table Empleados (
IdEmpleado int primary key not null,
Nombres varchar(50) not null,
Apellidos varchar(50) not null,
Cargo varchar(50) null,
Direccion varchar(50) null,
Telefono varchar(50) null,
Ciudad varchar(50) null
)
;


create table Empresa(
IdEmpresa int primary key not null,
NombreEmpresa varchar(50) not null,
Telefono varchar(50) null
);

create table Clientes(
IdCliente int primary key not null,
Nombre varchar(50) not null,
Apellidos varchar(50) not null,
Direccion varchar(50) null,
Telefono varchar(50) null,
Ciudad varchar(50) null
);


create table Productos(
IdProducto int primary key not null,
NombreProducto varchar(50) not null,
CantidadPorUnidad varchar(50) null,
PrecioUnidad decimal(10,0) null,
UnidadesEnExistencia int null,
UnidadesEnPedido int null
);


create table estado_pedido(
EstadoId int primary key not null,
Descripcion varchar(50) not null
);


create table Pedidos(
IdPedido int primary key not null,
IdCliente int null,
IdEmpleado int null,
IdEmpresa int not null,
FechaPedido datetime null,
FechaEntrega datetime null,
Estado int not null,
Destinatario varchar(50) null,
DireccionDestinatario varchar(50) null,
CiudadDestinatario varchar(50) null
);


create table Detalle_de_pedidos(
IdPedido int  not null,
IdProducto int not null,
PrecioUnidad decimal(10,0) not null,
Cantidad smallint not null,
Descuento decimal(10,0) not null,
constraint  PK_Detalle_pedidos primary key (idpedido,idproducto)
);



/********************************************************************************************************************************************************************************************************************
*****************************************************************************          Creacion de Relaciones      *************************************************************************************************
********************************************************************************************************************************************************************************************************************/


alter table Pedidos  add  constraint FK_Pedidos_Empleados foreign key (IdEmpleado) references Empleados (IdEmpleado);
alter table Pedidos  add  constraint FK_Pedidos_Clientes foreign key (IdCliente) references Clientes (IdCliente);
alter table Pedidos  add  constraint FK_Pedidos_Empresa foreign key (IdEmpresa) references Empresa (IdEmpresa);
alter table Pedidos  add  constraint FK_Pedidos_Estado  foreign key (Estado) references estado_pedido (EstadoId);
alter table Detalle_de_pedidos  add  constraint FK_Pedidos_Detalle_Pedidos   foreign key (IdPedido) references Pedidos (IdPedido);
alter table Detalle_de_pedidos  add  constraint FK_Pedidos_Productos foreign key (IdProducto) references Productos (IdProducto);



/********************************************************************************************************************************************************************************************************************
*****************************************************************************          Creacion de index        ****************************************************************************************************
********************************************************************************************************************************************************************************************************************/



create index empreado_id on empleados (idempleado);
create index empresa_id on empresa (idempresa);
create index cliente_id on clientes (idcliente);
create index producto_id on productos (idproducto);
create index pedido_id on pedidos (idpedido,idcliente,idempleado,idempresa,estado);
create index Detalle_de_pedidos_id on Detalle_de_pedidos (idpedido,idproducto);
create index estado_pedido_id on estado_pedido (EstadoId);


/********************************************************************************************************************************************************************************************************************
*****************************************************************************          Poblar Base de Datos      ****************************************************************************************************
********************************************************************************************************************************************************************************************************************/

insert into empleados values (1, 'Ricardo', 'Sanchez',  'Vendedor',  'Calle 80 #24',  '316 875 0947', 'Bogota');
insert into empleados values (2, 'Daniel',  'Carrillo', 'Vendedor',  'Calle 180 #16', '316 875 0947', 'Bogota');
insert into empleados values (3, 'Yuly',    'Cardona',  'Vendedor',  'Calle 30 #24',  '316 875 0947', 'Bogota');


insert into empresa values (1,'Merqueo SAS','3132408424');


insert into clientes values (1,'Laura',     'Lara',    'calle 97a #9a-50',  '313 240 8424', 'Bogota');
insert into clientes values (2,'Sebastian', 'Salgado', 'calle 97a #13a-50', '316 616 9625', 'Bogota');
insert into clientes values (3,'Catalina',  'Urrego',  'calle 100a #9a-50', '312 234 3424', 'Bogota');
insert into clientes values (4,'Diego',     'Castro',  'calle 80a #9a-50',  '310 567 0945', 'Bogota');
insert into clientes values (5,'Deyvid',    'Beltran', 'calle 24a #9a-50',  '322 224 0000', 'Bogota');


insert into productos values (1,'Bolsa de Leche',6,1200,10,1);
insert into productos values (2,'Bolsa de Arroz 3 kilos',1,17000,2,1);
insert into productos values (3,'Bolsa de Lentehas',1,1400,10,1);
insert into productos values (4,'Bolsa de Frijoles',6,1200,10,1);


insert into estado_pedido values (1, 'Entregado');
insert into estado_pedido values (2, 'Proceso');
insert into estado_pedido values (3, 'Cancelado');


insert into pedidos values (1,1,1,1,timestamp(now()),'2018-10-05 14:00:00',1,'Cliente','calle 97a #9a-50','Bogota');
insert into pedidos values (2,1,2,1,timestamp(now()),'2018-10-06 14:00:00',2,'Cliente','calle 97a #9a-50','Bogota');
insert into pedidos values (3,1,1,1,timestamp(now()),'2018-10-07 14:00:00',1,'Cliente','calle 97a #9a-50','Bogota');

insert into pedidos values (4,2,3,1,timestamp(now()),'2018-10-05 14:00:00',1,'Cliente','calle 97a #9a-50','Bogota');
insert into pedidos values (5,2,3,1,timestamp(now()),'2018-10-08 14:00:00',2,'Cliente','calle 97a #9a-50','Bogota');
insert into pedidos values (6,2,1,1,timestamp(now()),'2018-10-07 14:00:00',3,'Cliente','calle 97a #9a-50','Bogota');


insert into pedidos values (7,3,1,1,timestamp(now()),'2018-10-05 14:00:00',1,'Cliente','calle 97a #9a-50','Bogota');
insert into pedidos values (8,3,1,1,timestamp(now()),'2018-10-06 14:00:00',2,'Cliente','calle 97a #9a-50','Bogota');
insert into pedidos values (9,3,1,1,timestamp(now()),'2018-10-10 14:00:00',2,'Cliente','calle 97a #9a-50','Bogota');

insert into pedidos values (10,4,2,1,timestamp(now()),'2018-10-09 14:00:00',1,'Cliente','calle 97a #9a-50','Bogota');
insert into pedidos values (11,4,2,1,timestamp(now()),'2018-10-06 14:00:00',3,'Cliente','calle 97a #9a-50','Bogota');
insert into pedidos values (12,4,1,1,timestamp(now()),'2018-10-07 14:00:00',1,'Cliente','calle 97a #9a-50','Bogota');


insert into pedidos values (13,5,1,1,timestamp(now()),'2018-10-15 14:00:00',1,'Cliente','calle 97a #9a-50','Bogota');
insert into pedidos values (14,5,2,1,timestamp(now()),'2018-10-06 14:00:00',1,'Cliente','calle 97a #9a-50','Bogota');
insert into pedidos values (15,5,3,1,timestamp(now()),'2018-10-07 14:00:00',3,'Cliente','calle 97a #9a-50','Bogota');


insert into Detalle_de_pedidos values (1,1,1200,3,0);
insert into Detalle_de_pedidos values (1,2,17000,1,0);
insert into Detalle_de_pedidos values (1,3,1400,1,0);
insert into Detalle_de_pedidos values (1,4,1300,2,0);
insert into Detalle_de_pedidos values (2,1,1200,3,0);
insert into Detalle_de_pedidos values (2,4,1300,1,0);
insert into Detalle_de_pedidos values (3,3,1400,1,0);
insert into Detalle_de_pedidos values (4,1,1200,6,0);
insert into Detalle_de_pedidos values (4,2,17000,6,0);
insert into Detalle_de_pedidos values (4,3,1400,6,0);
insert into Detalle_de_pedidos values (4,4,1300,6,0);
insert into Detalle_de_pedidos values (5,1,1200,6,0);
insert into Detalle_de_pedidos values (5,4,1300,6,0);
insert into Detalle_de_pedidos values (6,3,1400,6,0);
insert into Detalle_de_pedidos values (6,2,17000,6,0);
insert into Detalle_de_pedidos values (6,4,1300,6,0);
insert into Detalle_de_pedidos values (7,1,1200,6,0);
insert into Detalle_de_pedidos values (8,1,1200,6,0);
insert into Detalle_de_pedidos values (9,1,1200,6,0);
insert into Detalle_de_pedidos values (10,1,1200,6,0);
insert into Detalle_de_pedidos values (10,3,1400,6,0);
insert into Detalle_de_pedidos values (11,1,1200,6,0);
insert into Detalle_de_pedidos values (11,4,1300,6,0);
insert into Detalle_de_pedidos values (12,4,1300,6,0);
insert into Detalle_de_pedidos values (13,1,1200,6,0);
insert into Detalle_de_pedidos values (14,2,17000,6,0);
insert into Detalle_de_pedidos values (15,3,1400,6,0);



/********************************************************************************************************************************************************************************************************************
***************************          Consulta sql: 	Todos los usuarios junto con la cantidad de dinero gastado por cada uno, junto con la cantidad de productos comprados.          *********************************
********************************************************************************************************************************************************************************************************************/




select cl.idcliente, 
       concat(cl.nombre, ' ',  cl.apellidos) as nombres,  
	   sum(dt.preciounidad) as total_gastado,
       count(dt.idproducto) as total_productos
from pedidos pe inner join detalle_de_pedidos dt on pe.idpedido = dt.idpedido
				inner join clientes cl on pe.idcliente = cl.idcliente
group by 1,2;   


/********************************************************************************************************************************************************************************************************************
***************************          Consulta sql: 	El reporte de los productos comprados, ordenados de mayor a menor, junto con el total del dinero recaudado por cada productos.    *******************************
********************************************************************************************************************************************************************************************************************/
             


select pr.nombreproducto , sum(dt.preciounidad) dinero_recaudado
from   detalle_de_pedidos dt inner join productos pr on dt.idproducto = pr.idproducto
group by 1
order by 2 desc;


/********************************************************************************************************************************************************************************************************************
***************************          Consulta sp: 	Todos los usuarios junto con la cantidad de dinero gastado por cada uno, junto con la cantidad de productos comprados.          *********************************
********************************************************************************************************************************************************************************************************************/


delimiter $
create procedure sp_consulta_venta_usuario ()
	begin
		select cl.idcliente as idcliente,
        concat(cl.nombre, ' ',  cl.apellidos) as nombres,  
        sum(dt.preciounidad) as total_gastado,
		count(dt.idproducto) as total_productos		 
			   
		from pedidos pe inner join detalle_de_pedidos dt on pe.idpedido = dt.idpedido
						inner join clientes cl on pe.idcliente = cl.idcliente
        group by 1,2;                 
	
   end$

call consulta_venta_usuario();


/********************************************************************************************************************************************************************************************************************
***************************          Consulta sp: 	El reporte de los productos comprados, ordenados de mayor a menor, junto con el total del dinero recaudado por cada productos.    *******************************
********************************************************************************************************************************************************************************************************************/


delimiter $
create procedure sp_consulta_recaudo_productos ()
	begin
		select pr.nombreproducto , 
        sum(dt.preciounidad) dinero_recaudado
        
		from   detalle_de_pedidos dt inner join productos pr on dt.idproducto = pr.idproducto
		group by 1
		order by 2 desc;
    end$    

call sp_consulta_recaudo_productos();
               


/********************************************************************************************************************************************************************************************************************
***************************          Consulta vw: 	Todos los usuarios junto con la cantidad de dinero gastado por cada uno, junto con la cantidad de productos comprados.          *********************************
********************************************************************************************************************************************************************************************************************/

               
 
 create view vw_consulta_venta_usuario
 as
 select cl.idcliente, 
       concat(cl.nombre, ' ',  cl.apellidos) as nombres,  
	   sum(dt.preciounidad) as total_gastado,
       count(dt.idproducto) as total_productos
       
from pedidos pe inner join detalle_de_pedidos dt on pe.idpedido = dt.idpedido
				inner join clientes cl on pe.idcliente = cl.idcliente
group by 1,2;                

select * from vw_consulta_venta_usuario;



/********************************************************************************************************************************************************************************************************************
***************************          Consulta vw: 	El reporte de los productos comprados, ordenados de mayor a menor, junto con el total del dinero recaudado por cada productos.    *******************************
********************************************************************************************************************************************************************************************************************/




create view vw_consulta_recaudo_productos
as
select pr.nombreproducto , 
sum(dt.preciounidad) dinero_recaudado
from   detalle_de_pedidos dt inner join productos pr on dt.idproducto = pr.idproducto
group by 1
order by 2 desc;

select * from vw_consulta_recaudo_productos;





/********************************************************************************************************************************************************************************************************************
*******************	Crear el script para una tabla que guarde el usuario o referencia al usuario y actualice la cantidad de órdenes a partir de un trigger en la tabla de facturas/órdenes.    **********************
********************************************************************************************************************************************************************************************************************/



create table auditoria (
idauditoria int primary key auto_increment,
creado_por varchar (50)  null,
fecha_creacion  datetime  null,
New_IdPedido int  null,
New_IdCliente int null,
New_IdEmpleado int null,
New_IdEmpresa int not null,
New_FechaPedido datetime null,
New_FechaEntrega datetime null,
New_Estado int  null,
New_Destinatario varchar(50) null,
New_DireccionDestinatario varchar(50) null,
New_CiudadDestinatario varchar(50) null,
Modificado_por varchar (50)  null,
Fecha_modificacion  datetime  null,
Old_IdPedido int  null,
Old_IdCliente int null,
Old_IdEmpleado int null,
Old_IdEmpresa int  null,
Old_FechaPedido datetime null,
Old_FechaEntrega datetime null,
Old_Estado int  null,
Old_Destinatario varchar(50) null,
Old_DireccionDestinatario varchar(50) null,
Old_CiudadDestinatario varchar(50) null
);



delimiter $
create trigger tg_auditoria_pedidos_in
before insert on pedidos
	for each row 
	begin
		insert into auditoria
		(creado_por,fecha_creacion,New_IdPedido,New_IdCliente,New_IdEmpleado,New_IdEmpresa, New_FechaPedido,New_FechaEntrega,New_Estado,New_Destinatario,New_DireccionDestinatario,New_CiudadDestinatario)
		values (current_user, now(),new.idpedido, new.idcliente, new.idempleado, new.idempresa, new.fechapedido,new.fechaentrega, new.estado, new.destinatario, new.direcciondestinatario,new.ciudaddestinatario);
	end $



delimiter $
create trigger tg_auditoria_pedidos_up
before update on pedidos
	for each row 
	begin
		insert into auditoria
		(Modificado_por,Fecha_modificacion,old_IdPedido,old_IdCliente,old_IdEmpleado,old_IdEmpresa, old_FechaPedido,old_FechaEntrega,old_Estado,old_Destinatario,old_DireccionDestinatario,old_CiudadDestinatario)
		values (current_user, now(),old.idpedido, old.idcliente, old.idempleado, old.idempresa, old.fechapedido,old.fechaentrega, old.estado, old.destinatario, old.direcciondestinatario,old.ciudaddestinatario);
	end $

select * from auditoria;


insert into pedidos values (16,5,3,1,timestamp(now()),'2018-10-07 14:00:00',3,'Cliente','calle 97a #9a-50','Bogota');
update pedidos set estado = 1 where idpedido = 16;

select * from auditoria;




create view vw_ejemplo_factura_general
as
select 
       pe.idpedido, 
       concat(cl.nombre, ' ', cl.apellidos) as cliente,
       cl.telefono,
       pe.fechapedido,
       pe.fechaentrega,
       es.nombreempresa,
       pe.ciudaddestinatario,
       pe.DireccionDestinatario,
       pr.nombreproducto,
       dt.cantidad,
       dt.preciounidad,
       (dt.cantidad * dt.preciounidad) as total,
       concat(em.nombres, ' ', em.apellidos) as Empleado,
       em.cargo,
       ep.descripcion as estado_pedido
       
       
       
       
from   pedidos pe inner join detalle_de_pedidos dt on pe.idpedido = dt.idpedido 
				  inner join clientes cl on pe.idcliente = cl.idcliente
                  inner join empleados em on pe.idempleado = em.idempleado
                  inner join empresa  es  on pe.idempresa = es.idempresa
                  inner join productos pr on dt.idproducto = pr.idproducto
                  inner join estado_pedido ep on pe.estado = ep.EstadoId;
                  
                  
select * from vw_ejemplo_factura_general;                  







 