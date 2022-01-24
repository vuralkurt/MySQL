create table hastaneler
(
ID varchar(10),
ISIM varchar(50),
SEHIR varchar(20),
OZEL varchar(5) );

insert into hastaneler values ('H101','ACI MADEM HASTANESI','ISTANBUL','Y');
insert into hastaneler values ('H102','HASZEKI HASTANESI','ISTANBUL','N');
insert into hastaneler values ('H103','MEDIKOL HASTANESI','IZMIR','Y');
insert into hastaneler values ('H104','NEMORYIL HASTANESI','ANKARA','Y');


create table hastalar
( 
KIMLIK_NO varchar(50)  primary key ,
ISIM varchar(25),
TESHIS varchar(25)
);

insert into hastalar values ('12345678901','Ali Can','Gizli Seker');
insert into hastalar values ('45678901121','Ayse Yilmaz','Hipertansiyon');
insert into hastalar values ('78901123451','Steve Job','Pankreatit');
insert into hastalar values ('12344321251','Tom Hanks','COVID19');


create table bolumler
(
BOLUM_ID varchar(10) primary key,
BOLUM_ADI varchar(25)
);
insert into bolumler values ('DHL','Dahiliye');
insert into bolumler values ('KBB','Kulak-Burun-Bogaz');
insert into bolumler values ('NRJ','Noroloji');
insert into bolumler values ('GAST','Gastroloji');
insert into bolumler values ('KARD','Kardiyoloji');
insert into bolumler values ('PSK','Psikiyatri');
insert into bolumler values ('GOZ','Goz Hastaliklari');
select*from bolumler;

create table Hasta_Kayit
(
KIMLIK_NO varchar(20) primary key,
HAST_ISIM varchar(25),
HASTANE_ADI varchar(50),
BOLUM_ADI varchar(35),
TESHIS varchar(25)
);

select*from Hasta_Kayit;

insert into Hasta_Kayit (KIMLIK_NO,HAST_ISIM)values (1111,'NO NAME');
insert into Hasta_Kayit (KIMLIK_NO,HAST_ISIM)values (2222,'NO NAME');
insert into Hasta_Kayit (KIMLIK_NO,HAST_ISIM)values (3333,'NO NAME');

 update Hasta_Kayit  set HAST_ISIM='Salvadore Dali'   where KIMLIK_NO=3333;
 update Hasta_Kayit  set HASTANE_ADI='John Hopins'   where KIMLIK_NO=3333;
 update Hasta_Kayit  set BOLUM_ADI='Noroloji'   where KIMLIK_NO=3333;
 update Hasta_Kayit  set TESHIS='Parkinson'   where KIMLIK_NO=3333;
 update Hasta_Kayit  set KIMLIK_NO='99991111222'  where TESHIS='Parkinson';
---------------------------------------------------------------------------
select*from Hasta_Kayit;

update hasta_kayit
set hast_isim=(select isim from hastalar where TESHIS='Gizli Seker')
where kimlik_no=1111;

update hasta_kayit
set HASTANE_ADI=(select isim from hastaneler where id='H104')
where kimlik_no=1111;
 
update hasta_kayit
set BOLUM_ADI=(select bolum_adi from bolumler where bolum_id='DHL')
where kimlik_no=1111;

update hasta_kayit
set teshis=(select teshis from hastalar where isim='Ali Can')
where kimlik_no=1111;

update hasta_kayit
set kimlik_no=(select kimlik_no from hastalar where isim='ali can')
where kimlik_no=1111;

---------------------------------------------------------------------

select*from Hasta_Kayit;

update hasta_kayit
set hast_isim=(select isim from hastalar where isim='Ayse yilmaz')
where kimlik_no=2222;

update hasta_kayit
set HASTANE_ADI=(select isim from hastaneler where id='H103')
where kimlik_no=2222;
 
update hasta_kayit
set bolum_adi=(select bolum_adi from bolumler where bolum_id='KBB')
where kimlik_no=2222;

update hasta_kayit
set teshis=(select teshis from hastalar where isim='tom hanks')
where kimlik_no=2222;

update hasta_kayit
set kimlik_no=(select kimlik_no from hastalar where isim='Steve Job')
where kimlik_no=2222;


------------------------------------------------------------------------



