

create function getHouseId(@zip varchar(4), @adress varchar(64))
returns int
as
  begin
		declare @id int;
		select @id = (select house_id
		                 from house 
						 where zip = @zip and adress = @adress);
		if(@id is null)
		  set @id = 0;
	    return @id;
  end;
 
 go

create function getNextHouseId()
returns int
as
  begin
    declare @next int;
	select @next = (select count(house_id) from house);
	if(@next is null)
	  set @next = 0;
	set @next = @next + 1;
	return @next;
  end;

go

create function getNextRoomId(@house int)
returns int
as
  begin
    declare @next int;
	select @next = (select count(roomNr) from room where house_id=@house);
	if(@next is null)
	  set @next = 0;
	set @next = @next + 1;
	return @next;
  end;

go



/*
drop function getHouseId;
drop function getNextHouseId;
drop function getNextRoomId;*/