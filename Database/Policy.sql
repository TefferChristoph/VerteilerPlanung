

/* In dieser Datei werden die Berechtigungen für die Datenbank vergeben*/

USE [master]
GO
CREATE LOGIN [VerteilerPlanung-Admin] WITH PASSWORD=N'test1' MUST_CHANGE, DEFAULT_DATABASE=[Verteilerplanung], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [VerteilerPlanung-Admin]
GO
USE [Verteilerplanung]
GO
CREATE USER [VerteilerPlanung-Admin] FOR LOGIN [VerteilerPlanung-Admin]
GO
USE [Verteilerplanung]
GO
ALTER ROLE [db_owner] ADD MEMBER [VerteilerPlanung-Admin]
GO

USE [Verteilerplanung]
GO

/****** Object:  DatabaseRole [VerteilerPlanung-Users]    Script Date: 22.02.2022 11:42:27 ******/

USE [master]
GO
CREATE LOGIN [MaxMustermann] WITH PASSWORD=N'test1' MUST_CHANGE, DEFAULT_DATABASE=[Verteilerplanung], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
USE [Verteilerplanung]
GO
CREATE USER [MaxMustermann] FOR LOGIN [MaxMustermann]
GO
USE [Verteilerplanung]
GO
ALTER ROLE [VerteilerPlanung-Users] ADD MEMBER [MaxMustermann]
GO


CREATE ROLE [VerteilerPlanung-Users]
GO

--Den Usern alle Rechte auf allen Tabellen entziehen


DENY UPDATE, ALTER,SELECT,INSERT,DELETE,REFERENCES, VIEW DEFINITION, VIEW CHANGE TRACKING,
     TAKE OWNERSHIP,CONTROL
	 ON [dbo].[House] TO [VerteilerPlanung-Users]
GO

DENY UPDATE, ALTER,SELECT,INSERT,DELETE,REFERENCES, VIEW DEFINITION, VIEW CHANGE TRACKING,
     TAKE OWNERSHIP,CONTROL
	 ON [dbo].[Room] TO [VerteilerPlanung-Users]
GO
DENY UPDATE, ALTER,SELECT,INSERT,DELETE,REFERENCES, VIEW DEFINITION, VIEW CHANGE TRACKING,
     TAKE OWNERSHIP,CONTROL
	 ON [dbo].[DeviceRoom] TO [VerteilerPlanung-Users]
GO

DENY UPDATE, ALTER,SELECT,INSERT,DELETE,REFERENCES, VIEW DEFINITION, VIEW CHANGE TRACKING,
     TAKE OWNERSHIP,CONTROL
	 ON [dbo].[Device] TO [VerteilerPlanung-Users]
GO

DENY UPDATE, ALTER,SELECT,INSERT,DELETE,REFERENCES, VIEW DEFINITION, VIEW CHANGE TRACKING,
     TAKE OWNERSHIP,CONTROL
	 ON [dbo].[HouseHold] TO [VerteilerPlanung-Users]
GO
DENY UPDATE, ALTER,SELECT,INSERT,DELETE,REFERENCES, VIEW DEFINITION, VIEW CHANGE TRACKING,
     TAKE OWNERSHIP,CONTROL
	 ON [dbo].[Socket] TO [VerteilerPlanung-Users]
GO
DENY UPDATE, ALTER,SELECT,INSERT,DELETE,REFERENCES, VIEW DEFINITION, VIEW CHANGE TRACKING,
     TAKE OWNERSHIP,CONTROL
	 ON [dbo].[FuseHouse] TO [VerteilerPlanung-Users]
GO
DENY UPDATE, ALTER,SELECT,INSERT,DELETE,REFERENCES, VIEW DEFINITION, VIEW CHANGE TRACKING,
     TAKE OWNERSHIP,CONTROL
	 ON [dbo].[FuseHouse] TO [VerteilerPlanung-Users]
GO


--Den Usern Rechte zum Ausführen von Stored Procedures

use [Verteilerplanung]
GO
GRANT EXECUTE ON [dbo].[HouseHoldList] TO [VerteilerPlanung-Users]
GO
use [Verteilerplanung]
GO
GRANT EXECUTE ON [dbo].[roomList] TO [VerteilerPlanung-Users]
GO
use [Verteilerplanung]
GO
GRANT EXECUTE ON [dbo].[insertHousehold] TO [VerteilerPlanung-Users]
GO
use [Verteilerplanung]
GO
GRANT EXECUTE ON [dbo].[SocketList] TO [VerteilerPlanung-Users]
GO
use [Verteilerplanung]
GO
GRANT EXECUTE ON [dbo].[fuseList] TO [VerteilerPlanung-Users]
GO


select * from room;