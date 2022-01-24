--create database Verteilerkasten;

drop table FuseHouse;
drop table Fuse;
drop table Socket;
drop table HouseHold;
drop table ShDevice;
drop table DeviceRoom;
drop table Device;
drop table Room;
drop table House;
go

create table House(
	house_id int primary key,
	adress varchar(64),
	zip varchar(4),
	city varchar(64),
	floors int,
	wire varchar(8)

);
go

create table Room(
	house_id int,
	roomNr int,
	floorNr int,
	descr varchar(64),
	foreign key(house_id) references House(house_id),
	primary key(house_id, roomNr)
);
go


create table Device(
	dev_id int primary key,
	descr varchar(32)
);
go

create table DeviceRoom(
	house_id int,
	roomNr int,
	dev_id int,
	number int,
	foreign key(house_id, roomNr) references Room(house_id, roomNr),
	foreign key(dev_id) references Device(dev_id),
	primary key(house_id, roomNr, dev_id)
);
go



create table ShDevice(
	device int references Device(dev_id) primary key,
	chanels int
);
go


create table HouseHold(
	device int references Device(dev_id) primary key,
	power int,
	phase int
);
go

create table Socket(
	device int references Device(dev_id) primary key,
	Typ varchar(32),
	phase int,
	ampere decimal(5,2)
);

create table Fuse(
	fuse_id int primary key,
	descr varchar(32),
	Typ varchar(4),
	ampere decimal(5,2),
	phase int
);
go

create table FuseHouse(
	fuse int references Fuse(fuse_id),
	house int references House(house_id),
	number int,
	primary key(house, fuse)
);
go

--C# Selects
select Device.descr, Household.phase, Household.power
from Device join HouseHold on Device.dev_id = Household.device

select Device.descr, Socket.phase, Socket.ampere
from Device join Socket on Device.dev_id = Socket.device