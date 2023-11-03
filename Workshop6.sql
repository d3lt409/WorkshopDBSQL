
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
select p.idPublicacion,p.Titulo,p.FechaPublicacion, count(*) num_comentarios
from publicacion p 
inner join comentario c on p.idPublicacion = c.idPublicacion
group by p.idPublicacion,p.Titulo,p.FechaPublicacion order by num_comentarios desc limit 3;



