
create procedure calcSockets(@house int)
as
  begin
   
	declare @floors int;
	declare @cnt int = 1;
	declare @roomNr int;
	declare @roomName varchar(64); 
	declare @Typ varchar(32);
	declare @Device varchar(32);
	declare @Ampere decimal(5,2);
	declare @Phase int;

	declare @fuseTab table (house int, 
							room int,
							fuse int);

	set @floors = (select h.floors
	                from house h
					where h.house_id = @house
	);

	
	while @cnt <= @floors
	  begin
		declare roomCursor cursor
		  for select r.roomNr, r.descr, s.Typ, d.descr,s.ampere, s.phase
				from room r join
				  DeviceRoom dr on r.roomNr = dr.roomNr join
				  Device d on d.dev_id = dr.dev_id join
				  Socket s on s.device = d.dev_id 
				where r.house_id = @house and r.floorNr = @cnt;
		;
		open roomCursor;
		fetch roomCursor into @roomNr,@roomName,@Typ,@Device,@Ampere, @Phase;
		while @@FETCH_STATUS = 0 
		  begin
		  
		    if @Phase = 3
			  begin
			    if @Ampere = 16
				  begin
				    print('LS B 16 3');
				    --insert into @fuseTab values (@house, @roomNr, 1)
				  end
				else if @Ampere > 16 and @Ampere < 25
				  begin
				    print('LS B 25 3');
				  end
				else if @Ampere > 25
				  begin
				    print('LS B 32 3');
				  end
			  end
			if @Typ = 'CEE'
			  begin
			    print('LS B power, 3');
			  end
			fetch next from roomCursor into @roomNr,@roomName,@Typ,@Device,@Ampere,@Phase;
		  end
		close roomCursor;
		deallocate roomCursor;
		set @cnt = @cnt +1;
	  end;
  end
	
go
exec calcSockets 1;
drop procedure calcSockets;
