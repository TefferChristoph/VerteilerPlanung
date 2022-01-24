

insert into house(house_id, adress,zip,city,floors) values
	(1,'Haupstraße 37','1090','Wien',2),
	(2,'Berggasse 19','7210','Mattersurg',1),
	(3,'Bahnstraße 15','7222','Rohrbach',1),
	(4,'Wienerstraße 102','2700','Wiener Neustadt',3),
	(5,'Theatergasse 55','1190','Wien',1),
	(6,'Haupstraße 37','2700','Wiener Neustadt',2),
	(7,'njaaaaaaaaaaaaaaaaaaaaaaa','2700','Wiener Neustadt',2),
	(8,'abcde','2700','Wiener Neustadt',2),
	(9,'def','123','hak',3)
;

insert into house(house_id, adress,zip,city,floors) values(100,'ttt','1234','ffffff',3);

go

insert into room(house_id, roomNr,floorNr,descr) values
	--House 1
	(1,1,1,'Badezimmer'),
	(1,2,1,'Küche'),
	(1,3,1,'Esszimmer'),
	(1,4,1,'Arbeitszimmer'),
	(1,5,1,'Wohnzimmer'),
	(1,6,2,'Schlafzimmer'),
	(1,7,2,'Kinderzimmer'),
	(1,8,2,'Badezimmer 2'),
	(1,9,2,'Testzimmer'),

	--House 2
	(2,1,1,'Badezimmer'),
	(2,2,1,'Küche'),
	(2,3,1,'Esszimmer'),
	(2,4,1,'Schlafzimmer'),
	(2,5,1,'Wohnzimmer'),

	--Hosue 3
	(3,1,1,'Badezimmer'),
	(3,2,1,'Küche'),
	(3,3,1,'Esszimmer'),
	(3,4,1,'Arbeitszimmer'),
	(3,5,1,'Schlafzimmer'),
	(3,6,1,'Wohnzimmer'),
	(3,7,1,'Badezimmer 2'),

	--House 4
	(4,1,1,'Badezimmer'),
	(4,2,1,'Küche'),
	(4,3,1,'Esszimmer'),
	(4,4,2,'Arbeitszimmer'),
	(4,5,2,'Schlafzimmer'),
	(4,6,1,'Wohnzimmer'),
	(4,7,2,'Badezimmer 2'),
	(4,8,3,'Badezimmer 3'),
	(4,9,3,'Kinderzimmer'),
	(4,10,3,'Kinderzimmer 2'),

	--House 5
	(5,1,1,'Badezimmer'),
	(5,2,1,'Küche'),
	(5,3,1,'Esszimmer'),
	(5,4,1,'Wohnzimmer'),
	(5,5,1,'Schlafzimmer'),
	(5,6,1,'Büro'),

	--House 6
	(6,1,1,'Abstellraum'),
	(6,2,1,'Küche'),
	(6,3,1,'Esszimmer'),
	(6,4,1,'Arbeitszimmer'),
	(6,5,2,'Wohnzimmer'),
	(6,6,2,'Schlafzimmer'),
	(6,7,2,'Kinderzimmer'),
	(6,8,2,'Badezimmer')
;
go

insert into device values
	(1,'Waschmaschine'),
	(2,'Steckdose'),
	(3,'3er Steckdose'),
	(4,'LED Lampe'),
	(5,'LED Leuchtröhre'),
	(6,'Kühlschrank'),
	(7,'Elektroherd'),
	(8,'Trockner'),
	(9,'Gefierschrank'),
	(10,'Starkstrom anschluss'),
	(11,'Fernseher'),
	(12,'Stehlampe'),
	(13,'abc'),
	(14,'cba'),
	(15,'acb')
;
go

insert into HouseHold(device,power,phase) values
	(1,20,3),
	(4,20,1),
	(5,23,1),
	(6,10,2),
	(7,16,3),
	(8,22,3),
	(9,20,3),
	(11,15,2),
	(12,30,1)
;
go

insert into socket values
	(2,'SHUKO',1,13),
	(3,'SHUKO',1,16),
	(10,'CEE',3,16),
	(13,'CEE',3,32),
	(14,'CEE',3,63),
	(15,'Arbeitssteckdose',1,16)
;
go

insert into DeviceRoom (house_id,roomNr,dev_id,number) values
	(1,1,1,1),
	(1,1,3,1),
	(1,1,4,2),
	(1,1,8,1),
	(1,2,3,1),
	(1,2,7,1),
	(1,2,6,1),
	(1,2,5,3),
	(1,3,2,4),
	(1,3,4,6),
	(1,4,2,4),
	(1,4,4,6),
	(1,5,12,2),
	(1,5,11,1),
	(1,5,2,3),
	(1,5,5,2),
	(1,6,11,1),
	(1,6,2,3),
	(1,6,5,2),
	(1,7,11,1),
	(1,7,2,3),
	(1,7,5,2),
	(1,8,1,1),
	(1,8,3,1),
	(1,8,4,2),
	(1,8,8,1),
	(1,2,10,1)
;
go

insert into fuse(fuse_id,descr,Typ,ampere,phase) values 
	(1,'FI',null, 40, 3),
	(2,'FI',null, 40, 3),
	(3,'FILS','B', 16, 1),
	(4,'FILS','C', 16, 1),
	(5,'FILS','B', 13, 1),
	(6,'FILS','C', 13, 1),
	(7,'LS','B', 16, 1),
	(8,'LS','B', 13, 1),
	(9,'LS','C', 16, 1),
	(10,'LS','C', 13, 1),
	(11,'LS','B', 25, 3),
	(12,'LS','B', 32, 3),
	(13,'LS','B', 63, 3),
	(14,'LS','C', 16, 3),
	(15,'LS','C', 25, 3),
	(16,'LS','C', 32, 3),
	(17,'LS','C', 63, 3)
;
go




select * from house;
select * from room;
select * from device;
select * from household;
select * from socket;

select h.adress, h.city, r.descr,d.descr, dr.number
	from DeviceRoom dr join 
	Room r on r.roomNr = dr.roomNr and r.house_id = dr.house_id join
	House h on h.house_id = dr.house_id join
	Device d on d.dev_id = dr.dev_id
;
/*
delete from FuseHouse;
delete from fuse;
delete from DeviceRoom;
delete from room;
delete from house;
delete from household;
delete from socket;
delete from device;
*/


