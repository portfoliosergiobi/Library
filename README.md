# Hotel

create table clientes (
  id bigint primary key generated always as identity,
  nombre text not null,
  tipo_cliente text
);

create table hoteles (
  id bigint primary key generated always as identity,
  nombre text not null,
  ubicación text not null,
  categoría text
);

create table habitaciones (
  id bigint primary key generated always as identity,
  hotel_id bigint references hoteles (id),
  tipo_habitación text not null,
  tarifa_base numeric not null
);

create table reservas (
  id bigint primary key generated always as identity,
  hotel_id bigint references hoteles (id),
  cliente_id bigint references clientes (id),
  fecha_reserva date not null,
  fecha_entrada date not null,
  fecha_salida date not null,
  estado_reserva text not null
);

create table producción (
  id bigint primary key generated always as identity,
  hotel_id bigint references hoteles (id),
  fecha date not null,
  adr numeric,
  adrp numeric,
  revpar numeric,
  habitaciones_ocupadas integer,
  ocupación numeric
);

create table incidencias (
  id bigint primary key generated always as identity,
  hotel_id bigint references hoteles (id),
  fecha date not null,
  descripción text
);

create table ventas (
  id bigint primary key generated always as identity,
  hotel_id bigint references hoteles (id),
  fecha date not null,
  ventas_totales numeric,
  ocupación numeric
);

create table predicciones (
  id bigint primary key generated always as identity,
  hotel_id bigint references hoteles (id),
  fecha date not null,
  reservas_predichas integer
);

create table tvp (
  id bigint primary key generated always as identity,
  hotel_id bigint references hoteles (id),
  fecha date not null,
  ingresos numeric,
  franja_horaria text
);

create table mesas (
  id bigint primary key generated always as identity,
  hotel_id bigint references hoteles (id),
  fecha date not null,
  mesas_ocupadas integer,
  coste_medio_mesa numeric
)
