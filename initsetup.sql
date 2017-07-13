create table company(
  id serial primary key,
  date_crated timestamp now(),
  name text not null,
  group_code text not null
);
create table key(
  id serial primary key,
  date_crated timestamp now(),
  key text not null,
  company_id int references company(id)
);
create table user(
  id serial primary key,
  date_crated timestamp now(),
  company int references company(id),
  first_name text not null,
  last_name text not null,
  type text not null
);
create table signature(
  id serial primary key,
  date_crated timestamp now(),
  owner_id int references user(id),
  signature_path text not null
);
create table document(
  id serial primary key,
  date_crated timestamp now(),
  title text not null,
  owner int references user(id)
);
create table version(
  id serial primary key,
  date_crated timestamp now(),
  document_path text not null,
  document int references document(id)
);
create table recipent(
  id serial primary key,
  date_crated timestamp now(),
  status text not null,
  sender references user(id),
  is_local boolean default false
);