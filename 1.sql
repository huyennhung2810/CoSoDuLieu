create table farvorite(
	id bigint primary key ,
	video_id varchar (50) ,
	username varchar (30) ,
	liked_date date  ,
	foreign key (username) references account (username),
	foreign key (video_id) references video(id)
	
);

create table video (
	id varchar (50) primary key ,
	title nvarchar (200) ,
	image varchar (500) ,
	views int ,
	description varchar (MAX) ,
	active bit 
);