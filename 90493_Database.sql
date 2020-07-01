===========================================MODUL 1=============================================================================
C:\Users\user>sqlplus system/system 
 
SQL*Plus: Release 11.2.0.2.0 Production on Jum Apr 10 02:03:46  2020 
 
Copyright (c) 1982, 2014, Oracle.  All rights reserved. 
 
 
Connected to: Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production 

SQL> CREATE TABLESPACE Fakhirah_90493   
   2  datafile 'D:\semester 4\praktikum basdat\fakhirah_90493_modul1.dbf'  
   3  size 30M; 
 
Tablespace created. 

SQL> CREATE USER fakhirah_90493   
	2  IDENTIFIED BY vera   
	3  DEFAULT TABLESPACE Fakhirah_90493   
	4  QUOTA 30M ON Fakhirah_90493; 
 
User created. 

SQL> GRANT ALL PRIVILEGES TO fakhirah_90493; 

Grant succeeded. 

SQL> conn fakhirah_90493/vera 
Connected. 

SQL> create table Admin_90493   
	2  (   
	3  user_name                VARCHAR2(20)             not null,   
	4  nama                     VARCHAR2(30),   
	5  password                 VARCHAR2(20),   
	6  constraint PK_user_name primary key (user_name) 
	7  ); 
 
Table created. 

SQL> create table Gudang_90493   
	2  (   
	3  id_gudang                INTEGER                  not null,   
	4  lokasi                   VARCHAR2(100),   
	5  kapasitas                INTEGER,   
	6  constraint PK_id_gudang primary key (id_gudang)   
	7  ); 
 
Table created. 
SQL> create table Barang_90493   
	2  (   
	3  id_barang                 INTEGER                 not null,   
	4  user_name                 VARCHAR2(20),   
	5  nama_barang               VARCHAR2(20),   
	6  tanggal_masuk             DATE,   
	7  tanggal_expired           DATE,   
	8  kemasan_barang            INTEGER,   
	9  jumlah_stok               INTEGER,  
	10  harga                     NUMBER(20),  
	11  jenis_sembako             VARCHAR2(20)  
	12  ); 
	
Table created. 
 
SQL> alter table Barang_90493   
	2  add constraint PK_id_barang primary key (id_barang)   
	3  add constraint FK_user_name FOREIGN KEY(user_name)   
	4  references Admin_90493(user_name); 
 
Table altered. 
 
SQL> create sequence id_barang   
	2  minvalue 1   
	3  maxvalue 9999 
	4  start with 1   
	5  increment by 1   
	6  cache 20; 
 
Sequence created. 
 
SQL> insert into Barang_90493   
	2  (id_barang)values   
	3  (id_barang.nextval); 
 
1 row created.

SQL> create table Menyimpan_90493   
	2  (   
	3  id_gudang                INTEGER,   
	4  id_barang                INTEGER,   
	5  tanggal_masuk            DATE,   
	6  jumlah_stok              INTEGER); 
	
Table created. 

SQL> alter table Menyimpan_90493   
	2  add constraint FK_id_gudang FOREIGN KEY(id_gudang)   
	3  references Gudang_90493(id_gudang);   
	4  add constraint FK_id_barang FOREIGN KEY(id_barang)   
	5  references Barang_90493(id_barang); 
	
Table altered. 
 
SQL> alter table Barang_90493 modify(90493_harga)); 

alter table Barang_90493 modify(90493_harga))                           * ERROR at line 1: ORA-00904: : invalid identifier 
 
SQL> alter table Menyimpan_90493    
	2 add constraint PK_tanggal_masuk UNIQUE (tanggal_masuk); 
 
Table altered. 
 
 
SQL> alter table Barang_90493 modify (kemasan_barang  VARCHAR(30)); 
 
Table altered. 
===========================================MODUL 2===============================================================================
SQL> conn fakhirah_90493
Enter password:
Connected.
SQL> insert all
  2  into Admin_90493(user_name,nama,password)values ('adi123','Adi','Admin1')
  3  into Admin_90493(user_name,nama,password)values ('inimei','Mei','Admin2')
  4  into Admin_90493(user_name,nama,password)values ('diswu','Wulan','Admin3')
  5  select 1 from dual;

3 rows created.

SQL> insert into Admin_90493(user_name,nama,password)values ('adila123','Adila','Admin4');

1 row created.

SQL> insert into Admin_90493(user_name,nama,password)values ('ila13','Lila','Admin5');

1 row created.

SQL> insert into Gudang_90493 (id_gudang,lokasi,kapasitas)values (1,'Menur','30');

1 row created.

SQL>  insert into Gudang_90493 (id_gudang,lokasi,kapasitas)values (2,'Palem','80');

1 row created.

SQL> insert all
  2  into Gudang_90493(id_gudang,lokasi,kapasitas)values (3,'Manyar','20')
  3  into Gudang_90493(id_gudang,lokasi,kapasitas)values (4,'Merpati','90')
  4  into Gudang_90493(id_gudang,lokasi,kapasitas)values (5,'Lumer','80')
  5  select 1 from dual;

3 rows created.

SQL> insert all
  2  into Barang_90493(id_barang,user_name,nama_barang,tanggal_masuk,tanggal_expired,kemasan_barang,jumlah_stok,harga,jenis_sembako )values (1,'adi123','Gulaku',to_date('01/01/2017','dd/mm/yyyy'),to_date('01/01/2018','dd/mm/yyyy'),'40','100','50000','Gula')
  3  into Barang_90493(id_barang,user_name,nama_barang,tanggal_masuk,tanggal_expired,kemasan_barang,jumlah_stok,harga,jenis_sembako)values (2,'inimei','Sajiku',to_date('03/03/2017','dd/mm/yyyy'),to_date('03/03/2018','dd/mm/yyyy'),'10','60','25000','Tepung')
  4  into Barang_90493(id_barang,user_name,nama_barang,tanggal_masuk,tanggal_expired,kemasan_barang,jumlah_stok,harga,jenis_sembako)values (3,'diswu','Senar',to_date('01/10/2017','dd/mm/yyyy'),to_date('01/10/2018','dd/mm/yyyy'),'50','200','125000','Beras')
  5  select 1 from dual;

3 rows created.

SQL> insert into Barang_90493(id_barang,user_name,nama_barang,tanggal_masuk,tanggal_expired,kemasan_barang,jumlah_stok,harga,jenis_sembako )values (4,'adila123','Garam kapal',to_date('27/01/2017','dd/mm/yyyy'),to_date('27/01/2018','dd/mm/yyyy'),'70','120','5000','Garam');

1 row created.

SQL> insert into Barang_90493(id_barang,user_name,nama_barang,tanggal_masuk,tanggal_expired,kemasan_barang,jumlah_stok,harga,jenis_sembako )values (5,'ila13','Garam Malay',to_date('29/01/2017','dd/mm/yyyy'),to_date('29/01/2018','dd/mm/yyyy'),'60','120','8000','Garam himalaya');

1 row created.

SQL> select * from barang_90493
  2  ;

 ID_BARANG USER_NAME            NAMA_BARANG          TANGGAL_MA TANGGAL_EX
---------- -------------------- -------------------- ---------- ----------
KEMASAN_BARANG JUMLAH_STOK      HARGA JENIS_SEMBAKO
-------------- ----------- ---------- --------------------
         1 adi123               Gulaku               01-01-2017 01-01-2018
            40         100      50000 Gula

         2 inimei               Sajiku               03-03-2017 03-03-2018
            10          60      25000 Tepung

         3 diswu                Senar                01-10-2017 01-10-2018
            50         200     125000 Beras


 ID_BARANG USER_NAME            NAMA_BARANG          TANGGAL_MA TANGGAL_EX
---------- -------------------- -------------------- ---------- ----------
KEMASAN_BARANG JUMLAH_STOK      HARGA JENIS_SEMBAKO
-------------- ----------- ---------- --------------------
         4 adila123             Garam kapal          27-01-2017 27-01-2018
            70         120       5000 Garam

         5 ila13                Garam Malay          29-01-2017 29-01-2018
            60         120       8000 Garam himalaya


SQL> UPDATE Barang_90493
  2   SET jenis_sembako = 'Bedak'  WHERE id_barang = 2;

1 row updated.

SQL> select * from barang_90493
  2  ;

 ID_BARANG USER_NAME            NAMA_BARANG          TANGGAL_MA TANGGAL_EX
---------- -------------------- -------------------- ---------- ----------
KEMASAN_BARANG JUMLAH_STOK      HARGA JENIS_SEMBAKO
-------------- ----------- ---------- --------------------
         1 adi123               Gulaku               01-01-2017 01-01-2018
            40         100      50000 Gula

         2 inimei               Sajiku               03-03-2017 03-03-2018
            10          60      25000 Bedak

         3 diswu                Senar                01-10-2017 01-10-2018
            50         200     125000 Beras


 ID_BARANG USER_NAME            NAMA_BARANG          TANGGAL_MA TANGGAL_EX
---------- -------------------- -------------------- ---------- ----------
KEMASAN_BARANG JUMLAH_STOK      HARGA JENIS_SEMBAKO
-------------- ----------- ---------- --------------------
         4 adila123             Garam kapal          27-01-2017 27-01-2018
            70         120       5000 Garam

         5 ila13                Garam Malay          29-01-2017 29-01-2018
            60         120       8000 Garam himalaya


SQL> UPDATE Barang_90493
  2  SET nama_barang ='Sembako' WHERE jenis_sembako LIKE '%a%' AND kemasan_barang < 80 OR id_barang <=5 ;

5 rows updated.

SQL> select * from barang_90493
  2  ;

 ID_BARANG USER_NAME            NAMA_BARANG          TANGGAL_MA TANGGAL_EX
---------- -------------------- -------------------- ---------- ----------
KEMASAN_BARANG JUMLAH_STOK      HARGA JENIS_SEMBAKO
-------------- ----------- ---------- --------------------
         1 adi123               Sembako              01-01-2017 01-01-2018
            40         100      50000 Gula

         2 inimei               Sembako              03-03-2017 03-03-2018
            10          60      25000 Bedak

         3 diswu                Sembako              01-10-2017 01-10-2018
            50         200     125000 Beras


 ID_BARANG USER_NAME            NAMA_BARANG          TANGGAL_MA TANGGAL_EX
---------- -------------------- -------------------- ---------- ----------
KEMASAN_BARANG JUMLAH_STOK      HARGA JENIS_SEMBAKO
-------------- ----------- ---------- --------------------
         4 adila123             Sembako              27-01-2017 27-01-2018
            70         120       5000 Garam

         5 ila13                Sembako              29-01-2017 29-01-2018
            60         120       8000 Garam himalaya


SQL> commit;

Commit complete.

SQL> select * from admin_90493
  2  ;

USER_NAME            NAMA                           PASSWORD
-------------------- ------------------------------ --------------------
adi123               Adi                            Admin1
inimei               Mei                            Admin2
diswu                Wulan                          Admin3
adila123             Adila                          Admin4
ila13                Lila                           Admin5

SQL> UPDATE Admin_90493
  2  SET password = 'Admin' WHERE user_name LIKE '%i%';

5 rows updated.

SQL> select * from admin_90493
  2  ;

USER_NAME            NAMA                           PASSWORD
-------------------- ------------------------------ --------------------
adi123               Adi                            Admin
inimei               Mei                            Admin
diswu                Wulan                          Admin
adila123             Adila                          Admin
ila13                Lila                           Admin

SQL> savepoint admin;

Savepoint created.

SQL> rollback to admin;

Rollback complete.

SQL> select * from admin_90493
  2  ;

USER_NAME            NAMA                           PASSWORD
-------------------- ------------------------------ --------------------
adi123               Adi                            Admin
inimei               Mei                            Admin
diswu                Wulan                          Admin
adila123             Adila                          Admin
ila13                Lila                           Admin

SQL> UPDATE Gudang_90493
  2  SET lokasi = 'Menyar' WHERE id_gudang = 3;

1 row updated.

SQL> select * from gudang_90493;

 ID_GUDANG
----------
LOKASI
--------------------------------------------------------------------------------
 KAPASITAS
----------
         1
Menur
        30

         2
Palem
        80

 ID_GUDANG
----------
LOKASI
--------------------------------------------------------------------------------
 KAPASITAS
----------

         3
Menyar
        20

         4
Merpati

 ID_GUDANG
----------
LOKASI
--------------------------------------------------------------------------------
 KAPASITAS
----------
        90

         5
Lumer
        80

SQL> UPDATE Gudang_90493
  2  SET kapasitas = '100' WHERE lokasi LIKE '%e%' AND id_gudang <=5 ;

5 rows updated.

SQL> select * from gudang_90493;

 ID_GUDANG
----------
LOKASI
--------------------------------------------------------------------------------
 KAPASITAS
----------
         1
Menur
       100

         2
Palem
       100

 ID_GUDANG
----------
LOKASI
--------------------------------------------------------------------------------
 KAPASITAS
----------

         3
Menyar
       100

         4
Merpati

 ID_GUDANG
----------
LOKASI
--------------------------------------------------------------------------------
 KAPASITAS
----------
       100

         5
Lumer
       100


SQL> DELETE FROM Barang_90493
  2  WHERE user_name LIKE '%i%' AND jenis_sembako LIKE '%a%' OR id_barang <4 ;

5 rows deleted.

SQL> savepoint first;

Savepoint created.

SQL> rollback to first;

Rollback complete.

SQL> select * from barang_90493;

no rows selected

SQL> rollback to first;

Rollback complete.

SQL> select * from barang_90493;

no rows selected

SQL> select user_name
  2  FROM admin_90493
  3  GROUP BY user_name;

USER_NAME
--------------------
adi123
adila123
diswu
ila13
inimei

SQL> SELECT * FROM gudang_90493
  2  ORDER BY lokasi ASC;

 ID_GUDANG
----------
LOKASI
--------------------------------------------------------------------------------
 KAPASITAS
----------
         5
Lumer
       100

         1
Menur
       100

 ID_GUDANG
----------
LOKASI
--------------------------------------------------------------------------------
 KAPASITAS
----------

         3
Menyar
       100

         4
Merpati

 ID_GUDANG
----------
LOKASI
--------------------------------------------------------------------------------
 KAPASITAS
----------
       100

         2
Palem
       100

==============================================MODUL 3==========================================================================
SQL> insert all
  2  into Admin_90493(user_name,nama,password)values ('Akusiapa','Asa','Admin')
  3  into Admin_90493(user_name,nama,password)values ('hello','hila','Admin')
  4  into Admin_90493(user_name,nama,password)values ('newbie','mita','Admin')
  5  into Admin_90493(user_name,nama,password)values ('yohanna','yohan','Admin')
  6  into Admin_90493(user_name,nama,password)values ('lulaby','lula','Admin')
  7  select 1 from dual;
5 rows created.

SQL> insert all
  2  into Gudang_90493(id_gudang,lokasi,kapasitas)values (6,'Ampel','45')
  3  into Gudang_90493(id_gudang,lokasi,kapasitas)values (7,'Perak','70')
  4  into Gudang_90493(id_gudang,lokasi,kapasitas)values (8,'gemilang','35')
  5  into Gudang_90493(id_gudang,lokasi,kapasitas)values (9,'bunguraseh','85')
  6  into Gudang_90493(id_gudang,lokasi,kapasitas)values (10,'belimbing','55')
  7  select 1 from dual;

5 rows created.

SQL> insert all
  2    into Barang_90493(id_barang,user_name,nama_barang,tanggal_masuk,tanggal_expired,kemasan_barang,jumlah_stok,harga,jenis_sembako )values (6,'Akusiapa','Sembako',to_date('23/01/2017','dd/mm/yyyy'),to_date('23/01/2018','dd/mm/yyyy'),'45','95','17000','Telur')
  3    into Barang_90493(id_barang,user_name,nama_barang,tanggal_masuk,tanggal_expired,kemasan_barang,jumlah_stok,harga,jenis_sembako)values (7,'hello','Sembako',to_date('03/12/2017','dd/mm/yyyy'),to_date('03/12/2018','dd/mm/yyyy'),'5','600','2500','Mie')
  4    into Barang_90493(id_barang,user_name,nama_barang,tanggal_masuk,tanggal_expired,kemasan_barang,jumlah_stok,harga,jenis_sembako)values
(8,'newbie','Sembako',to_date('18/02/2017','dd/mm/yyyy'),to_date('18/02/2018','dd/mm/yyyy'),'30','200','12500','Jahe')
  5    into Barang_90493(id_barang,user_name,nama_barang,tanggal_masuk,tanggal_expired,kemasan_barang,jumlah_stok,harga,jenis_sembako)values (9,'yohanna','Sembako',to_date('01/07/2017','dd/mm/yyyy'),to_date('01/07/2018','dd/mm/yyyy'),'40','30','10000','Kemiri')
  6    into Barang_90493(id_barang,user_name,nama_barang,tanggal_masuk,tanggal_expired,kemasan_barang,jumlah_stok,harga,jenis_sembako)values (10,'lulaby','Sembako',to_date('12/10/2017','dd/mm/yyyy'),to_date('12/10/2018','dd/mm/yyyy'),'55','270','15000','Jinten')
  7   select 1 from dual;
5 rows created.

SQL> SELECT kapasitas, MAX (kapasitas) AS terbanyak, MIN (kapasitas) AS terendah FROM Gudang_90493
     GROUP BY kapasitas;

 KAPASITAS  TERBANYAK   TERENDAH
---------- ---------- ----------
        30         30         30
        20         20         20
        90         90         90
        70         70         70
        85         85         85
        35         35         35
        55         55         55
        80         80         80
        45         45         45

9 rows selected.

SQL>  select id_barang, count (id_barang) as barang from barang_90493
where id_barang = 5 AND jenis_sembako LIKE '%a%' OR user_name LIKE '%i%' group by id_barang;

 ID_BARANG     BARANG
---------- ----------
         1          1
         6          1
         2          1
         4          1
         5          1
         8          1
         3          1

7 rows selected.

SQL> select id_barang, sum (id_barang) as jumlah_item from barang_90493
where id_barang = 6 group by id_barang;

 ID_BARANG JUMLAH_ITEM
---------- -----------
         6           6


SQL>  select avg (id_barang) as rata_rata from barang_90493;

 RATA_RATA
----------
       5,5

SQL> select id_barang
from barang_90493 where id_barang in
(select count (id_barang) as barang from barang_90493 where id_barang = 5 AND jenis_sembako LIKE '%a%' OR user_name LIKE '%i%');

 ID_BARANG
----------
         7

SQL> select kapasitas
from gudang_90493 where kapasitas in
(select sum(kapasitas) from gudang_90493 where id_gudang =3);

 KAPASITAS
----------
        20

SQL>  select kapasitas
from gudang_90493 where kapasitas = ANY
(select avg(kapasitas) from gudang_90493 where id_gudang =4);

 KAPASITAS
----------
        90

 select jumlah_stok from barang_90493 where jumlah_stok = ANY
  2  (select jumlah_stok from barang_90493 group by jumlah_stok);

JUMLAH_STOK
-----------
        100
         30
        120
        120
         95
        600
        270
        200
        200
         60

10 rows selected.
SQL> select (select avg(jumlah_stok) from barang_90493) as "stok", (select count(kemasan_barang) from barang_90493) as "kemasan", (select max(harga) from barang_90493) as "harga_terbesar",(select min(harga) from barang_90493) as "harga_terkecil" from dual;

      stok    kemasan harga_terbesar harga_terkecil
---------- ---------- -------------- --------------
     179,5         10         125000           2500
	 
================================================MODUL 4==========================================================================
SQL> insert all   
	2  into Admin_90493(user_name,nama,password)values ('haikal10','ical','Admin')   
	3  into Admin_90493(user_name,nama,password)values ('ibaliba','liba','Admin')   
	4  into Admin_90493(user_name,nama,password)values ('qilala','lala','Admin')   
	5  into Admin_90493(user_name,nama,password)values ('puji21','yuji','Admin')   
	6  into Admin_90493(user_name,nama,password)values ('wehana','nana','Admin')   
	7  select 1 from dual; 
 
5 rows created. 

SQL> insert all   
	2  into Gudang_90493(id_gudang,lokasi,kapasitas)values (11,'Lumajang','85')   
	3  into Gudang_90493(id_gudang,lokasi,kapasitas)value s (12,'Pandaan','70')   
	4  into Gudang_90493(id_gudang,lokasi,kapasitas)value s (13,'Bandung','45')   
	5  into Gudang_90493(id_gudang,lokasi,kapasitas)value s (14,'bagasi','65')   
	6  into Gudang_90493(id_gudang,lokasi,kapasitas)value s (15,'palangkaraya','50')   
	7  select 1 from dual; 
 
5 rows created. 

SQL> insert all   
	2  into Barang_90493(id_barang,user_name,nama_barang, tanggal_masuk,tanggal_expired,kemasan_barang, jumlah_stok,harga,jenis_sembako )values (11,'haikal10','Sembako',to_date('29/05/2017' ,'dd/mm/yyyy'),to_date('29/05/2018','dd/mm/yy yy'),'30','75','10000','Mentega')   
	3  into Barang_90493(id_barang,user_name,nama_barang, tanggal_masuk,tanggal_expired,kemasan_barang, jumlah_stok,harga,jenis_sembako)values (12,'ibaliba','Sembako',to_date('13/12/2017', 'dd/mm/yyyy'),to_date('13/12/2018','dd/mm/yyy y'),'60','70','15000','Mentega putih')   
	4  into Barang_90493(id_barang,user_name,nama_barang, tanggal_masuk,tanggal_expired,kemasan_barang, jumlah_stok,harga,jenis_sembako)values (13,'qilala','Sembako',to_date('08/07/2017',' dd/mm/yyyy'),to_date('08/07/2018','dd/mm/yyyy '),'70','50','21500','Minyak Goreng')   
	5  into Barang_90493(id_barang,user_name,nama_barang, tanggal_masuk,tanggal_expired,kemasan_barang, jumlah_stok,harga,jenis_sembako)values (14,'puji21','Sembako',to_date('11/07/2017',' dd/mm/yyyy'),to_date('11/07/2018','dd/mm/yyyy '),'50','70','12000','Bawang merah')   
	6  into Barang_90493(id_barang,user_name,nama_barang, tanggal_masuk,tanggal_expired,kemasan_barang, jumlah_stok,harga,jenis_sembako)values (15,'wehana','Sembako',to_date('12/04/2017',' dd/mm/yyyy'),to_date('12/04/2018','dd/mm/yyyy '),'55','90','35000','Daging beku')   
	7  select 1 from dual; 
 
5 rows created.

SQL> DESC admin_90493  

Name                                      Null?    
Type  ----------------------------------------- ------- ----------------------------  
USER_NAME                                 NOT NULL VARCHAR2(20)  
NAMA                                               VARCHAR2(30)  
PASSWORD                                           VARCHAR2(20) 
 
SQL> DESC Barang_90493  

Name                                      Null?    
Type  ----------------------------------------- ------- ----------------------------  
ID_BARANG                                 NOT NULL NUMBER(38)  
USER_NAME                                          VARCHAR2(20)  
NAMA_BARANG                                        VARCHAR2(20)  
TANGGAL_MASUK                                      DATE  
TANGGAL_EXPIRED                                    DATE  
KEMASAN_BARANG                                     NUMBER(38)  
JUMLAH_STOK                                        NUMBER(38)  
HARGA                                              NUMBER(20)  
JENIS_SEMBAKO                                      VARCHAR2(20)
 
SQL> select a.nama, b.nama_barang, b.jenis_sembako, b.harga   
	2  FROM admin_90493 a JOIN  
	3  barang_90493 b   
	4  ON a.user_name = b.user_name   
	5  WHERE rownum <=10;
	
SQL> select a.nama, b.jenis_sembako, b.harga , (select count (*) from barang_90493) as total_barang   
	2  from admin_90493 a   
	3  left join barang_90493 b   
	4  ON a.user_name = b.user_name   
	5  where id_barang <=10;
	
SQL> select a.nama, b.jenis_sembako , b.jumlah_stok, (select max (id_barang) from barang_90493) AS max   
	2  from admin_90493 a   
	3  right join barang_90493 b   
	4  on a.user_name = b.user_name   
	5  where id_barang <= 10 AND jenis_sembako like '%a%';

SQL> create view list_harga   
	2  as select id_barang,jenis_sembako, harga   
	3  from barang_90493; 
 
View created. 
 
SQL> insert into list_harga (id_barang,jenis_sembako, harga) values (12,'gula jawa', '15000'); 
 
1 row created.
 
SQL> create view sembako_barang   
	2  as select a.nama, b.nama_barang, b.jenis_sembako, b.harga   
	3  FROM admin_90493 a JOIN   
	4  barang_90493 b   
	5  ON a.user_name = b.user_name   
	6  WHERE rownum <=10; 
 
View created. 
 
SQL> insert into sembako_barang (nama,nama_barang,jenis_sembako, harga) values (Mei,'Kenari','Kenari Gaarut', '25000');
																			* ERROR at line 1: ORA-00984: column not allowed here
 
SQL> create view total_sembako   
	2  as select a.nama, b.jenis_sembako, b.harga , (select count (*) from barang_90493) as total_barang   
	3  from admin_90493 a   
	4  left join barang_90493 b   
	5  ON a.user_name = b.user_name   
	6  where id_barang <=10; 
 
View created. 

SQL> insert into total_sembako (nama,jenis_sembako, harga) values (Adi,'Minyak goreng', '21000'); 
                                                             * ERROR at line 1: ORA-00984: column not allowed here 

SQL> create view lihat_terbesar   
	2  as select a.nama, b.jenis_sembako , b.jumlah_stok, (select max (id_barang) from barang_90493) AS max   
	3  from admin_90493 a   
	4  right join barang_90493 b   
	5  on a.user_name = b.user_name   
	6  where id_barang <= 10 AND jenis_sembako like '%a%'; 
 
View created. 
 
SQL> insert into lihat_terbesar (nama,jenis_sembako, jumlah_stok) values (Lila,'Sarden', '65');                                               
																	* ERROR at line 1: ORA-00984: column not allowed here
																	
==================================================================================================================================