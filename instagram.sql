drop table if exists users;
create table users (
	id serial primary key,
	name varchar(35)
);

drop table if exists comments;
create table comments (
	id serial primary key,
	comment_content varchar(255) not null,
	post_id int not null,
	user_id int not null
);

drop table if exists posts;
create table posts (
	id serial primary key,
	title varchar(255) not null,
	post_content varchar(255) not null,
	user_id int not null
);

drop table if exists comment_likes;
create table comment_likes (
	id serial primary key,
	user_id int not null,
	comment_id int not null
);

drop table if exists post_likes;
create table post_likes (
	id serial primary key,
	user_id int not null,
	post_id int not null
);

alter table posts add constraint fk_posts_user_id
foreign key (user_id) references users (id);

alter table comments add constraint fk_comments_post_id
foreign key (post_id) references posts (id);

alter table comments add constraint fk_comments_user_id
foreign key (user_id) references users (id);

alter table comment_likes add constraint fk_comment_likes_user_id
foreign key (user_id) references users (id);

alter table comment_likes add constraint fk_comment_likes_comment_id
foreign key (comment_id) references comments (id);

alter table post_likes add constraint fk_post_likes_user_id
foreign key (user_id) references users (id);

alter table post_likes add constraint fk_post_likes_post_id
foreign key (post_id) references posts (id);
