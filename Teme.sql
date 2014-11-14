/*
In simple terms,  a sequence is a new database object and a substitute for the Identity of columns.

Using the identity attribute for a column, you can easily generate auto-incrementing numbers (which as often used as a primary key). With Sequence,
it will be a different object which you can attach to a table column while inserting. Unlike identity, the next number for the column value will be 
retrieved from memory rather than from the disk – this makes Sequence significantly faster than Identity. 


A SQL Server sequence object generates sequence of numbers just like an identity column in sql tables. But the advantage of sequence numbers is the 
sequence number object is not limited with single sql table.
*/

-------TEMA2


CREATE DATABASE Teme;
GO

USE Teme;
GO
CREATE TABLE fisierxml
( id int primary key identity, 
  continut xml,
  nume nvarchar(30) 
  )
GO

Use Teme;
go

INSERT INTO fisierxml VALUES('<root>
--  <carte autor="Vasile" editura="Editura1">
--    <capitol numar="1"></capitol>
--    <capitol numar="2"></capitol>
--    <capitol numar="3"></capitol>
    
--  </carte>
--</root>','Vasile');

INSERT INTO fisierxml VALUES('<root>
--  <carte autor="Vasile" editura="Editura1">
--    <capitol numar="1"></capitol>
--    <capitol numar="2"></capitol>
--    <capitol numar="3"></capitol>
--	<capitol numar="4"></capitol>

    
--  </carte>
--</root>','Vasile')

INSERT INTO fisierxml VALUES('<root>
--  <carte autor="Marin" editura="Editura2">
--    <capitol numar="1"></capitol>
--    <capitol numar="2"></capitol>
--    <capitol numar="3"></capitol>
--	<capitol numar="4"></capitol>

    
--  </carte>
--</root>','Marin')
go

select * from fisierxml;
select * from fisierxml where nume like 'Vasile'

/*USE Tema2;
GO

   
SELECT * FROM fisier_xml;

USE Tema2;
GO

DECLARE @a xml (fisier_xml.biblioteca);
SET @a =  (SELECT  nume FROM fisier_xml where nume like 'Vasile');
SELECT @a;
GO

*/

----------TEMA3 : Am afisat din tabela Person.ContactType date despre persoanele ale caror nume au cea de-a doua cifra "s" sau incep su "s".

USE AdventureWorks2014
GO

DECLARE Contact__Cursor CURSOR
FOR SELECT * FROM Person.ContactType
WHERE  Name like '_s%' or Name like 's%'
ORDER BY Name

OPEN Contact__Cursor;
FETCH NEXT FROM Contact__Cursor;
 
WHILE @@FETCH_STATUS = 0
BEGIN

   FETCH NEXT FROM Contact__Cursor;
END

CLOSE Contact_Cursor;
DEALLOCATE contact_cursor;
GO

