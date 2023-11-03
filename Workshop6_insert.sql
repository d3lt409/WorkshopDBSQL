
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

insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) values (1, 'mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec', '2023/4/11', 1, 4);
insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) values (2, 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem', '2023/8/24', 1, 3);

insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) values (3, 'sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in', '2023/8/15', 2, 5);
insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) values (4, 'amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim', '2022/12/10', 2, 1);

insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) values (5, 'donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla', '2022/12/2', 3, 2);
insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) values (6, 'aliquam quis turpis eget elit sodales scelerisque mauris sit amet', '2023/7/30', 3, 5);

insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) values (7, 'porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem', '2023/9/20', 4, 1);
insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) values (8, 'turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis', '2022/11/17', 4, 3);

insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) values (9, 'vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris', '2023/5/29', 5, 3);
insert into comentario (idComentario, Comentario, FechaPublicacion, idPublicacion, idUsuario) values (10, 'mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus', '2023/4/8', 5, 2);

insert into comentario (Comentario, FechaPublicacion, idPublicacion, idUsuario) values ('mi nulla ac enim in tempor turpis n asdhgsd agd', '2023-10-11', 2, 4);

insert into comentario (Comentario, FechaPublicacion, idPublicacion, idUsuario) values ('aslkgjañlkgadfñgl jkasñdlkjasdñlgfkajxñdgalksdgj', '2023-11-01', 3, 3);




