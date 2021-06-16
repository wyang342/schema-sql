drop table if exists users;
create table users (
	id serial primary key,
	name varchar(255) not null,
	address varchar(255) not null
);

drop table if exists orders;
create table orders (
	id serial primary key,
	user_id int not null,
	menu_item_id int not null
);

drop table if exists menu_items;
create table menu_items (
	id serial primary key,
	restaurant_id int not null,
	name varchar(255) not null,
	price money not null
);

drop table if exists restaurants;
create table restaurants (
	id serial primary key,
	name varchar(255) not null
);


-- FK relationships go at the bottom
alter table orders add constraint fk_orders_user_id
foreign key (user_id) references users (id);

alter table orders add constraint fk_orders_menu_item_id
foreign key (menu_item_id) references menu_items (id);

alter table menu_items add constraint fk_menu_items_restaurant_id
foreign key (restaurant_id) references restaurants (id);