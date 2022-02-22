drop trigger tr_household_ins;
drop trigger tr_socket_ins;
drop trigger tr_household_del;
go

create trigger tr_household_ins on household
	after insert
	  as
	   begin
	   if exists(select * from inserted i join socket s on i.device = s.device)
	     begin
		   declare @dev int;
		   set @dev = (select i.device from inserted i join socket s on i.device = s.device);
		   
		   raiserror('Gerät %d ist bereits eine Steckdose',16,1,@dev);
		   rollback transaction;
		 end	   
	end
go

create trigger tr_socket_ins on socket
	after insert
	  as
	   begin
	   if exists(select i.device from inserted i join household h on i.device = h.device)
	     begin
		   declare @dev int;
		   set @dev = (select i.device from inserted i join household h on i.device = h.device);
		   
		   raiserror('Gerät %d ist bereits ein Haushaltsgerät',16,1,@dev);
		   rollback transaction;
		 end
	   end
go
