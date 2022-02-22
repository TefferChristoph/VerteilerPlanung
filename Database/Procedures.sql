

create procedure HouseHoldList(@house int, @room int = -1)
as
  begin
     if not exists (select h.house_id 
	                  from House h 
					  where h.house_id = @house
					)
	  begin
	    raiserror('Haus %d nicht in der Datenbak abgespeichert',16,1,@house);
	  end
	else if(@room = -1)
	  begin
	    
		select r.descr, ISNULL(d.descr,'kein Geraet'), coalesce(hh.power * dr.number,0) as Power, coalesce(dr.number,0)
		  from room r left join 
			   DeviceRoom dr on r.roomNr = dr.roomNr left join
			   Device d on dr.dev_id = d.dev_id left join
			   HouseHold hh on hh.device = d.dev_id
		  where r.house_id = @house and not exists (select s.device from socket s where d.dev_id = s.device)
	  end
	else if not exists (select r.house_id, r.roomNr 
	                  from room r 
					  where r.house_id = @house and r.roomNr = @room
					)
	  begin
	    raiserror('Raum %d nicht in der Datenbak abgespeichert',16,1,@room);
	  end
	else
	  begin
	    select r.descr, d.descr, hh.power * dr.number as Power, dr.number
	    from room r join
	      DeviceRoom dr on dr.house_id = r.house_id and 
		                   dr.roomNr = r.roomNr join
		  Device d on d.dev_id = dr.dev_id join
		  HouseHold hh on hh.device = d.dev_id
	    where r.house_id = @house and r.roomNr = @room; 
	
	  end
    
  end;
go


create procedure SocketList(@house int, @room int = -1)
as
  begin
     if not exists (select h.house_id 
	                  from House h 
					  where h.house_id = @house
					)
	  begin
	    raiserror('Haus %d nicht in der Datenbak abgespeichert',16,1,@house);
	  end
	else if(@room = -1)
	  begin
	    
		select r.descr, ISNULL(d.descr,'kein Geraet'), coalesce(s.ampere * dr.number,0) as Ampere, coalesce(dr.number,0)
			from room r left join
				 DeviceRoom dr on dr.house_id = r.house_id and 
								  dr.roomNr = r.roomNr left join
				 Device d on d.dev_id = dr.dev_id left join
				 Socket s on s.device = d.dev_id
			where r.house_id = @house and not exists (select hh.device from HouseHold hh where d.dev_id = hh.device);
	  end
	else if not exists (select r.house_id, r.roomNr 
	                  from room r 
					  where r.house_id = @house and r.roomNr = @room
					)
	  begin
	    raiserror('Raum %d nicht in der Datenbak abgespeichert',16,1,@room);
	  end
	else
	  begin
	    select r.descr, d.descr, s.ampere * dr.number as Ampere,dr.number
		  from room r join
	           DeviceRoom dr on dr.house_id = r.house_id and 
		                        dr.roomNr = r.roomNr join
		       Device d on d.dev_id = dr.dev_id join
		       Socket s on s.device = d.dev_id
	      where r.house_id = @house and r.roomNr = @room;
	  end
    
  end;
go



create procedure roomList(@house int,@room int = -1)
as
  begin
    exec HouseHoldList @house, @room;
	exec SocketList @house, @room;
	
  end;
go


create procedure fuseList(@house int)
as 
  begin
    if not exists (select fh.house
						   from FuseHouse fh
						   where fh.house = @house
					   )
	  begin
	    raiserror('Haus %d nicht in der Datenbank',16,3, @house);
	  end
	else 
	  begin
	    select fh.fuse, fh.number, f.ampere * fh.number as AmpereGes, fh.number
		  from FuseHouse fh join
		       fuse f on f.fuse_id = fh.fuse
		  where fh.house = @house
	  end
  end;
go



create procedure insertHousehold(@devId int, @descr varchar(32), @power int, @phase int)
as
	begin
	  if exists (select * from device d where d.dev_id = @devId)
	    begin
		   raiserror('Das Gerät %d befindet sich bereits in der Datenbank',16,3,@devId);
		end;
	  else
	    begin
		  insert into device values(@devId, @descr);
		  insert into HouseHold values(@devId, @power, @phase);
		end
  	end;
go

create procedure insertSocket(@devId int, @descr varchar(32), @type varchar(32), @phase int)
as
	begin
	  if exists (select * from device d where d.dev_id = @devId)
	    begin
		   raiserror('Das Gerät %d befindet sich bereits in der Datenbank',16,3,@devId);
		end;
	  else
	    begin
		  insert into device values(@devId, @descr);
		  insert into Socket values(@devId, @power, @phase);
		end
  	end;
go

create procedure deleteDevice(@devId int)
as
  begin
	if not exists (select * from device where dev_id = @devId)
	  begin
	    raiserror('Gerät %d nicht in der Datenbank',16,3,@devId);
	  end
	else 
	  begin
	    if exists(select * from HouseHold where device = @devId)
		  begin
			delete from HouseHold where device = @devId;
		  end;
		else if exists(select * from socket where device = @devId)
		  begin
		    delete from socket where device = @devId;
		  end;
		  delete from device where dev_id = @devId;
		end
  end;
  go

  exec insertHousehold 30,'test',10,10;
  select * from HouseHold;
  exec deleteDevice 30;
  select * from HouseHold;




/*
drop procedure roomList;
drop procedure HouseHoldList;
drop procedure socketList;
drop procedure fuseList;
drop procedure insertHousehold;
drop procedure insertScoket;
drop procedure deleteDevice;
*/