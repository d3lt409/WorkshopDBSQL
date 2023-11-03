-- --------------------------------------------------- CREACION TABLAS

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Workshop6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Workshop6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Workshop6` DEFAULT CHARACTER SET utf8 ;
USE `Workshop6` ;

-- -----------------------------------------------------
-- Table `Workshop6`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Workshop6`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  `Apellido` VARCHAR(100) NOT NULL,
  `NombreUsuario` VARCHAR(100) NOT NULL,
  `Correo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Workshop6`.`Publicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Workshop6`.`Publicacion` (
  `idPublicacion` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(500) NOT NULL,
  `FechaPublicacion` DATETIME NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idPublicacion`, `idUsuario`),
  INDEX `fk_Publicacion_Usuario_idx` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Publicacion_Usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Workshop6`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Workshop6`.`Comentario` (
  `idComentario` INT NOT NULL AUTO_INCREMENT,
  `Comentario` VARCHAR(500) NOT NULL,
  `FechaPublicacion` DATETIME NOT NULL,
  `idPublicacion` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idComentario`, `idPublicacion`, `idUsuario`),
  INDEX `fk_Comentario_Publicacion1_idx` (`idPublicacion` ASC) ,
  INDEX `fk_Comentario_Usuario1_idx` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Comentario_Publicacion1`
    FOREIGN KEY (`idPublicacion`)
    REFERENCES `Workshop6`.`Publicacion` (`idPublicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Workshop6`.`Amistad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Workshop6`.`Amistad` (
  `idAmistad` INT NOT NULL AUTO_INCREMENT,
  `Estado` ENUM('aceptada', 'pendiente', 'rechazada') NOT NULL,
  `FechaSolicitud` DATETIME NOT NULL,
  `FechaAmistad` DATETIME NULL,
  `idUsuario` INT NOT NULL,
  `idUsuario_solicitud` INT NOT NULL,
  PRIMARY KEY (`idAmistad`, `idUsuario`, `idUsuario_solicitud`),
  INDEX `fk_Amistad_Usuario1_idx` (`idUsuario` ASC) ,
  INDEX `fk_Amistad_Usuario2_idx` (`idUsuario_solicitud` ASC) ,
  CONSTRAINT `fk_Amistad_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Amistad_Usuario2`
    FOREIGN KEY (`idUsuario_solicitud`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Workshop6`.`Mensaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Workshop6`.`Mensaje` (
  `idMensaje` INT NOT NULL AUTO_INCREMENT,
  `Texto` VARCHAR(100) NOT NULL,
  `FechaEnviado` DATETIME NOT NULL,
  `idAmistad` INT NOT NULL,
  `idUsuario_envio` INT NOT NULL,
  `idUsuario_recibio` INT NOT NULL,
  PRIMARY KEY (`idMensaje`, `idAmistad`),
  INDEX `fk_Mensaje_Amistad1_idx` (`idAmistad` ASC) ,
  INDEX `fk_Mensaje_Usuario1_idx` (`idUsuario_envio` ASC) ,
  INDEX `fk_Mensaje_Usuario2_idx` (`idUsuario_recibio` ASC) ,
  CONSTRAINT `fk_Mensaje_Amistad1`
    FOREIGN KEY (`idAmistad`)
    REFERENCES `Workshop6`.`Amistad` (`idAmistad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mensaje_Usuario1`
    FOREIGN KEY (`idUsuario_envio`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mensaje_Usuario2`
    FOREIGN KEY (`idUsuario_recibio`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- --------------------------------------------------- 

-- --------------------------------------------------- INSERTAR VALORES

insert into usuario (idUsuario, Nombre, Apellido, NombreUsuario, Correo) values (1, 'Rebeca', 'Kindred', 'rkindred0', 'rkindred0@51.la');
insert into usuario (idUsuario, Nombre, Apellido, NombreUsuario, Correo) values (2, 'Gregory', 'Kelinge', 'gkelinge1', 'gkelinge1@jimdo.com');
insert into usuario (idUsuario, Nombre, Apellido, NombreUsuario, Correo) values (3, 'Jeanine', 'Sherston', 'jsherston2', 'jsherston2@earthlink.net');
insert into usuario (idUsuario, Nombre, Apellido, NombreUsuario, Correo) values (4, 'Emmy', 'Hair', 'ehair3', 'ehair3@noaa.gov');
insert into usuario (idUsuario, Nombre, Apellido, NombreUsuario, Correo) values (5, 'Tove', 'Marcussen', 'tmarcussen4', 'tmarcussen4@xinhuanet.com');

insert into usuario ( Nombre, Apellido, NombreUsuario, Correo) values ('Manuel', 'Fernandez', 'd3lt409', 'd3lt409@xinhuanet.com');

insert into usuario ( Nombre, Apellido, NombreUsuario, Correo) values ('Juan', 'Jimenez', 'Juan', 'Juan@xinhuanet.com');


insert into amistad (idAmistad, Estado, FechaSolicitud, FechaAmistad, idUsuario,idUsuario_solicitud) values (01, 'Aceptada', '2013/02/27', '2013/09/27', 1, 2);
insert into amistad (idAmistad, Estado, FechaSolicitud, idUsuario,idUsuario_solicitud) values (02, 'Pendiente', '2013/02/27', 1, 3);
insert into amistad (idAmistad, Estado, FechaSolicitud, FechaAmistad, idUsuario,idUsuario_solicitud) values (03, 'Rechazada', '2023/05/22', '2023/07/15', 1, 4);
insert into amistad (idAmistad, Estado, FechaSolicitud, FechaAmistad, idUsuario,idUsuario_solicitud) values (04, 'Aceptada', '2023/11/13', '2023/11/27', 1, 5);
insert into amistad (idAmistad, Estado, FechaSolicitud, FechaAmistad, idUsuario,idUsuario_solicitud) values (05, 'Aceptada', '2022/08/6', '2023/01/15', 2, 3);
insert into amistad (idAmistad, Estado, FechaSolicitud, FechaAmistad, idUsuario,idUsuario_solicitud) values (06, 'Aceptada', '2013/02/27', '2013/09/27', 2, 4);
insert into amistad (idAmistad, Estado, FechaSolicitud, idUsuario,idUsuario_solicitud) values (07, 'Pendiente', '2013/02/27', 2, 5);
insert into amistad (idAmistad, Estado, FechaSolicitud, FechaAmistad, idUsuario,idUsuario_solicitud) values (08, 'Rechazada', '2023/05/22', '2023/07/15', 3, 4);
insert into amistad (idAmistad, Estado, FechaSolicitud, FechaAmistad, idUsuario,idUsuario_solicitud) values (09, 'Aceptada', '2013/02/27', '2013/09/27', 3, 5);
insert into amistad (idAmistad, Estado, FechaSolicitud, idUsuario,idUsuario_solicitud) values (10, 'Pendiente', '2013/02/27',  4, 5);

insert into amistad (Estado, FechaSolicitud, FechaAmistad, idUsuario,idUsuario_solicitud) values ('Rechazada', '2023-02-27', '2023-09-27', 6, 1);
insert into amistad (Estado, FechaSolicitud, idUsuario,idUsuario_solicitud) values ('Pendiente', '2013/02/27',  6, 2);
insert into amistad (Estado, FechaSolicitud, idUsuario,idUsuario_solicitud) values ('Pendiente', '2013/02/27',  3, 6);

insert into amistad (Estado, FechaSolicitud, FechaAmistad, idUsuario,idUsuario_solicitud) values ('Pendiente', '2023-05-27', '2023-10-27', 7, 3);
insert into amistad (Estado, FechaSolicitud, FechaAmistad, idUsuario,idUsuario_solicitud) values ('Rechazada', '2013/04/27', '2021-10-27',  3, 7);
insert into amistad (Estado, FechaSolicitud, idUsuario,idUsuario_solicitud) values ('Pendiente', '2013/08/27',  7, 4);

insert into mensaje (idMensaje, Texto, FechaEnviado, idAmistad, idUsuario_envio, idUsuario_recibio) values (1, 'Hola, ¿cómo estás?', '2023/08/9', 01, 1, 2);
insert into mensaje (idMensaje, Texto, FechaEnviado, idAmistad, idUsuario_envio, idUsuario_recibio) values (2, 'Hi, cómo has estado', '2023/07/11', 04, 1, 5);

insert into mensaje (idMensaje, Texto, FechaEnviado, idAmistad, idUsuario_envio, idUsuario_recibio) values (3, 'hola, como va todo', '2023/01/30', 05, 2, 3);
insert into mensaje (idMensaje, Texto, FechaEnviado, idAmistad, idUsuario_envio, idUsuario_recibio) values (4, 'Que hay de ti', '2023/10/1', 06, 2, 4);

insert into mensaje (idMensaje, Texto, FechaEnviado, idAmistad, idUsuario_envio, idUsuario_recibio) values (5, 'como vas?', '2022/12/16', 09, 3, 5);
insert into mensaje (idMensaje, Texto, FechaEnviado, idAmistad, idUsuario_envio, idUsuario_recibio) values (6, 'hola', '2023/10/19', 02, 1, 3);

insert into mensaje (idMensaje, Texto, FechaEnviado, idAmistad, idUsuario_envio, idUsuario_recibio) values (7, 'Hola?', '2023/02/8', 07, 2, 5);
insert into mensaje (idMensaje, Texto, FechaEnviado, idAmistad, idUsuario_envio, idUsuario_recibio) values (8, 'Que onda?', '2023/07/4', 10, 4, 5);

insert into mensaje (idMensaje, Texto, FechaEnviado, idAmistad, idUsuario_envio, idUsuario_recibio) values (9, 'Hola', '2022/11/16', 08, 3, 4);
insert into mensaje (idMensaje, Texto, FechaEnviado, idAmistad, idUsuario_envio, idUsuario_recibio) values (10, 'hola', '2022/10/31', 03, 1, 4);

insert into mensaje (Texto, FechaEnviado, idAmistad, idUsuario_envio, idUsuario_recibio) values ('Hola, ¿cómo estás?', '2022/11/01', 3, 4, 1);



insert into publicacion (idPublicacion, Titulo, FechaPublicacion, idUsuario) values (1, 'Last Will of Dr. Mabuse, The (Testament du Dr. Mabuse, Le)', '2023/9/19', 1);
insert into publicacion (idPublicacion, Titulo, FechaPublicacion, idUsuario) values (2, 'Hobbit: The Desolation of Smaug, The', '2023/9/6', 2);
insert into publicacion (idPublicacion, Titulo, FechaPublicacion, idUsuario) values (3, 'Glory Road', '2023/10/21', 3);
insert into publicacion (idPublicacion, Titulo, FechaPublicacion, idUsuario) values (4, 'Generation, A (Pokolenie)', '2023/8/14', 4);
insert into publicacion (idPublicacion, Titulo, FechaPublicacion, idUsuario) values (5, 'Our Song', '2022/12/31', 5);
insert into publicacion (Titulo, FechaPublicacion, idUsuario) values ('Yo no sé qué publicar', '2023-09-20', 4);

insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) 
	values (1, 'mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec', '2023/4/11', 1, 4);
insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) 
	values (2, 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem', '2023/8/24', 1, 3);

insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) 	
	values (3, 'sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in', '2023/8/15', 2, 5);
insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) 
	values (4, 'amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim', '2022/12/10', 2, 1);

insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) 
	values (5, 'donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla', '2022/12/2', 3, 2);
insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) 
	values (6, 'aliquam quis turpis eget elit sodales scelerisque mauris sit amet', '2023/7/30', 3, 5);

insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) 
	values (7, 'porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem', '2023/9/20', 4, 1);
insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) 
	values (8, 'turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis', '2022/11/17', 4, 3);

insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) 
	values (9, 'vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris', '2023/5/29', 5, 3);
insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) 
	values (10, 'mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus', '2023/4/8', 5, 2);

insert into comentario (Comentario, FechaPublicacion, idPublicacion, idUsuario) 
	values ('mi nulla ac enim in tempor turpis n asdhgsd agd', '2023-10-11', 2, 4);

insert into comentario (Comentario, FechaPublicacion, idPublicacion, idUsuario) 
	values ('aslkgjañlkgadfñgl jkasñdlkjasdñlgfkajxñdgalksdgj', '2023-11-01', 3, 3);


-- --------------------------------------------------- CONSULTAS 


-- PRIMER PUNTO
select Nombre,Apellido, Titulo
from publicacion p inner join usuario u
on p.idUsuario = u.idUsuario
where p.idUsuario = 4;

-- SEGUNDO PUNTO
select * from publicacion where Titulo  like '%The%';

-- TERCER PUNTO
select p.*, c.Comentario,c.FechaPublicacion,c.idUsuario 
from publicacion p 
inner join comentario c on p.idPublicacion = c.idPublicacion
where p.idPublicacion = 4;

-- CUARTO PUNTO
select u.idUsuario, concat(u.Nombre, ' ',u.Apellido) as nombreUsuario, a.idUsuario_solicitud, concat(us.Nombre,' ' ,us.Apellido) as nombreSolicitud, a.FechaAmistad
from amistad a 
inner join usuario u on u.idUsuario = a.idUsuario 
inner join usuario us on us.idUsuario = a.idUsuario_solicitud 
where Estado = 'aceptada' and u.idUsuario = 1;

-- QUINTO PUNTO
select u.idUsuario, u.Nombre, u.Apellido, count(*) as Amistades 
from usuario u 
inner join amistad a on u.idUsuario = a.idUsuario 
where Estado = "Aceptada" and a.idUsuario =1;

-- SEXTO PUNTO
select u.Nombre, Titulo
from publicacion p
inner join amistad a on p.idUsuario = a.idUsuario_solicitud
inner join usuario u on a.idUsuario_solicitud = u.idUsuario
where a.idUsuario = 4 and a.Estado = 'Aceptada'
union ALL
select u.Nombre, Titulo
from publicacion p
inner join amistad a on p.idUsuario = a.idUsuario
inner join usuario u on a.idUsuario = u.idUsuario
where a.idUsuario_solicitud = 4 and a.Estado = 'Aceptada';

select u.nombre, p.titulo
from publicacion p, amistad a, usuario u 
where a.estado = 'Aceptada' AND ( 
	(a.idUsuario = 4 and a.idUsuario_solicitud = p.idUsuario and a.idUsuario_solicitud = u.idUsuario) -- Usuario que envié solicitud
		OR 
	(a.idUsuario_solicitud = 4 and a.idUsuario = p.idUsuario and a.idUsuario = u.idUsuario)  -- Usuario que enviaron solicitud
);

-- SEPTIMO PUNTO
select u.Nombre, p.Titulo, c.comentario
from publicacion p
inner join comentario c on p.idPublicacion = c.idPublicacion
inner join usuario u on c.idUsuario = u.idUsuario;

-- OCTAVO PUNTO
select u.Nombre nombre_solicitante, us.Nombre nombre_solicitud 
from amistad a
inner join usuario u on a.idUsuario = u.idUsuario
inner join usuario us on a.idUsuario_solicitud = us.idUsuario
where  a.Estado = 'Pendiente';

-- NOVENO PUNTO
select * from publicacion order by FechaPublicacion DESC;

-- DECIMO PUNTO
SELECT u.nombre, p.titulo as actividad, p.fechaPublicacion fecha, 'Publicacion' tipo 
FROM usuario u 
INNER JOIN publicacion p on p.idUsuario = u.idUsuario 
INNER JOIN (select idUsuario,max(fechaPublicacion) fechaPublicacion from publicacion group by idUsuario ) up on up.idUsuario = p.idUsuario AND up.fechaPublicacion = p.fechaPublicacion
where u.idUsuario = 4
UNION ALL
SELECT u.nombre, c.Comentario as actividad, c.fechaPublicacion fecha, 'Comentario' tipo  FROM usuario u 
INNER JOIN comentario c on c.idUsuario = u.idUsuario 
INNER JOIN (select idUsuario,max(fechaPublicacion) fechaPublicacion from comentario group by idUsuario ) up on up.idUsuario = c.idUsuario AND up.fechaPublicacion = c.fechaPublicacion
where u.idUsuario = 4;

select * from comentario where idUsuario = 4;

-- ONCEAVO PUNTO
select u.nombre, p.titulo
from publicacion p, amistad a, usuario u 
where a.estado = 'Aceptada' AND p.FechaPublicacion between '2023-08-01' and '2023-10-30 ' AND ( 
	(a.idUsuario_solicitud = p.idUsuario and a.idUsuario_solicitud = u.idUsuario) -- Usuario que envié solicitud
		OR 
	(a.idUsuario = p.idUsuario and a.idUsuario = u.idUsuario)  -- Usuario que enviaron solicitud
);

-- DOCEAVO PUNTO
select u.Nombre, u.Apellido, m.FechaEnviado, us.Nombre Nombre_Usuario_Recive, m.Texto Mensaje
	from mensaje m
    inner join usuario u on u.idUsuario = m.idUsuario_envio
    inner join usuario us on us.idUsuario = m.idUsuario_recibio 
    ORDER BY u.idUsuario, m.FechaEnviado;
		
-- TRECEAVO PUNTO
select m.FechaEnviado, ue.nombre, m.Texto, ur.nombre
from mensaje m,  usuario ue , usuario ur
where ( 
	(m.idUsuario_envio  = 4 and  m.idUsuario_recibio = 1 and m.idUsuario_envio = ue.idUsuario AND  m.idUsuario_recibio = ur.idUsuario) -- Usuario que envié solicitud
		OR 
	(m.idUsuario_envio = 1 and m.idUsuario_recibio = 4 and m.idUsuario_envio = ue.idUsuario AND  m.idUsuario_recibio = ur.idUsuario)  -- Usuario que enviaron solicitud
)
ORDER BY m.FechaEnviado;


-- CATORCEAVO PUNTO
select * from usuario where idUsuario not in (
	select u.idUsuario from usuario u, amistad a where (u.idUsuario = a.idUsuario or u.idUsuario = a.idUsuario_solicitud) and a.estado = 'aceptada'
	GROUP BY u.idUsuario
	order by u.idUsuario
);

-- QUINCEAVO PUNTO
select p.Titulo, p.FechaPublicacion, u.nombre, c.Comentario, c.FechaPublicacion FechaComentario 
from comentario c 
inner join publicacion p on c.idPublicacion = p.idPublicacion 
	AND c.idUsuario = p.idUsuario
inner join usuario u on p.idUsuario = u.idUsuario; 

-- DIECISEISAVO PUNTO
select p.idPublicacion,p.Titulo, count(*) num_comentarios
from publicacion p 
inner join comentario c on p.idPublicacion = c.idPublicacion
group by p.idPublicacion,p.Titulo 
order by num_comentarios desc 
limit 3;





