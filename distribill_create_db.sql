drop schema if exists distribill cascade;
create schema distribill;
set schema 'distribill';

CREATE TABLE fournisseur (
  nofour  CHAR(3),
  nomf    VARCHAR(20) NOT NULL,
  ville   VARCHAR(20) NOT NULL,
  CONSTRAINT fournisseur_pk PRIMARY KEY(nofour)
);

INSERT INTO fournisseur VALUES('F1','Bourhis','Paris');
INSERT INTO fournisseur VALUES('F2','Bourhis','Paris');
INSERT INTO fournisseur VALUES('F3','Collet','Reims');
INSERT INTO fournisseur VALUES('F4','Bossuet','Dijon');
INSERT INTO fournisseur VALUES('F5','Mercier','Riec');
INSERT INTO fournisseur VALUES('F6','Tanguy','Lannion');

create table produit(
  noproduit CHAR(3) primary key,
  nomp      VARCHAR(20) NOT NULL,
  origine   VARCHAR(20) NOT NULL,
  couleur   VARCHAR(20) NOT NULL
);


INSERT INTO produit(noproduit,nomp,couleur,origine) 
	VALUES('P1','Cassis','Rouge','Dijon');
INSERT INTO produit(noproduit,nomp,couleur,origine) 
	VALUES('P2','Champagne','Blanc','Reims');
INSERT INTO produit(noproduit,nomp,couleur,origine) VALUES
  ('P3','Huitre','Vert','Riec'),
	('P4','Moutarde','Jaune','Dijon'),
	('P5','Salade','Vert','Nice'),
	('P6','Cornichon','Vert','Dijon'),
	('P7','Muscadet','Blanc','Nantes');


create table fourniture(
  nofour      char(3),
  noproduit   char(3),
  quantite    INTEGER NOT NULL,
  constraint fourniture_pk primary key(nofour, noproduit)
);

INSERT INTO fourniture VALUES ('F1','P1',1);
INSERT INTO fourniture VALUES ('F1','P4',1);
INSERT INTO fourniture VALUES ('F1','P5',8);
INSERT INTO fourniture VALUES ('F1','P6',2);
INSERT INTO fourniture VALUES ('F2','P2',1);
INSERT INTO fourniture VALUES ('F2','P4',1);
INSERT INTO fourniture VALUES ('F3','P2',5);
INSERT INTO fourniture VALUES ('F3','P4',1);
INSERT INTO fourniture VALUES ('F4','P4',2);
INSERT INTO fourniture VALUES ('F4','P5',7);
INSERT INTO fourniture VALUES ('F4','P6',3);
INSERT INTO fourniture VALUES ('F5','P3',10);

/*
INSERT INTO fourniture VALUES ('F1','P1',2); -- pb de clé : normal
INSERT INTO fourniture VALUES ('F12','P1',2); -- pas de pb : pas normal, il manque une FK
*/

/* 
delete from fourniture where nofour = 'F12';
*/
alter table fourniture
  add constraint fourniture_fk_fournisseur
  foreign key(nofour) references fournisseur(nofour);
  
alter table fourniture
  add constraint fourniture_fk_produit
  foreign key(noproduit) references produit(noproduit);
