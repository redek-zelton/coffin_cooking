DROP DATABASE IF EXISTS Cooking;
CREATE DATABASE Cooking ;
USE `Cooking`;

CREATE TABLE client (nom varchar(20) NOT NULL, tel int);  
CREATE TABLE cdr (id varchar(10) NOT NULL, point float, nom varchar(20));  
CREATE TABLE produit (nom_p varchar(20) NOT NULL, categorie varchar(20), matiere ENUM('poudre','liquide','solide'),stock int, stock_min int, stock_max int, nom_f varchar(20));  
CREATE TABLE recette (nom_r varchar(50) NOT NULL, type varchar(20), descriptif varchar(256), prix int, id varchar(10));  
CREATE TABLE fournisseurs (nom_f varchar(20) NOT NULL, numtel int);  
CREATE TABLE composer (nom_r varchar(50) NOT NULL, nom_p varchar(20) NOT NULL, quantite int);
CREATE TABLE commander (nom varchar(20) NOT NULL, nom_r varchar(50) NOT NULL, num_c int, periode date );  
ALTER TABLE client ADD CONSTRAINT PK_client PRIMARY KEY (nom);  
ALTER TABLE cdr ADD CONSTRAINT PK_cdr PRIMARY KEY (id);  
ALTER TABLE produit ADD CONSTRAINT PK_produit PRIMARY KEY (nom_p);  
ALTER TABLE recette ADD CONSTRAINT PK_recette PRIMARY KEY (nom_r);  
ALTER TABLE fournisseurs ADD CONSTRAINT PK_fournisseurs PRIMARY KEY (nom_f);  
ALTER TABLE composer ADD CONSTRAINT PK_composer PRIMARY KEY (nom_r, nom_p);  
#ALTER TABLE commander ADD CONSTRAINT PK_commander PRIMARY KEY (nom, nom_r);  
ALTER TABLE cdr ADD CONSTRAINT FK_cdr_nom FOREIGN KEY (nom) REFERENCES client (nom);  
ALTER TABLE produit ADD CONSTRAINT FK_produit_nom_f FOREIGN KEY (nom_f) REFERENCES fournisseurs (nom_f);  
ALTER TABLE recette ADD CONSTRAINT FK_recette_id FOREIGN KEY (id) REFERENCES cdr (id);  
ALTER TABLE composer ADD CONSTRAINT FK_composer_nom_r FOREIGN KEY (nom_r) REFERENCES recette (nom_r);  
ALTER TABLE composer ADD CONSTRAINT FK_composer_nom_p FOREIGN KEY (nom_p) REFERENCES produit (nom_p);  
ALTER TABLE commander ADD CONSTRAINT FK_commander_nom FOREIGN KEY (nom) REFERENCES client (nom);  
ALTER TABLE commander ADD CONSTRAINT FK_commander_nom_r FOREIGN KEY (nom_r) REFERENCES recette (nom_r); 

INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Jean',34567);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Jeanne',2348653);
INSERT INTO `cooking`.`client` (`nom`,`tel`)VALUES ('General', 678796);
INSERT INTO `cooking`.`client` (`nom`,`tel`)VALUES ('Depardieu',52757665);
INSERT INTO `cooking`.`client` (`nom`,`tel`)VALUES ('Philippe', 4734567);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Julie', 252348653);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Jean-claude', 401796779);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Boon',42757665);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Bruce',4734567);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Vincent', 452348653);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Charlot',75672821);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Guillaume', 33757665);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Pierre', 5334567);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Jean-Paul', 3375235);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Jean-Pierre', 6334354);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Richard',57346767);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Noe', 38986519);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Plouf', 6219836);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Léa', 816428310);
INSERT INTO `cooking`.`client` (`nom`,`tel`) VALUES ('Fabrice',5734);

-- (2) insertion dans la table cdr
INSERT INTO `cooking`.`cdr` (`id`, `point`, `nom`) VALUES ('DOWJONES', 7.8, 'Depardieu');
INSERT INTO `cooking`.`cdr` (`id`, `point`, `nom`) VALUES ('NISSEI', 5, 'Philippe');
INSERT INTO `cooking`.`cdr` (`id`, `point`, `nom`) VALUES ('CAC40', 3.1, 'Richard');
INSERT INTO `cooking`.`cdr` (`id`, `point`, `nom`) VALUES ('DAX', 0, 'Pierre');

-- (3) insertion dans la table fournisseurs
INSERT INTO `cooking`.`fournisseurs` (`nom_f`,`numtel`) VALUES ('Boucherie',76831);
INSERT INTO `cooking`.`fournisseurs` (`nom_f`,`numtel`) VALUES ('Cremier',3164983);
INSERT INTO `cooking`.`fournisseurs` (`nom_f`,`numtel`) VALUES ('Maraichais',824163);
INSERT INTO `cooking`.`fournisseurs` (`nom_f`,`numtel`) VALUES ('Bonbon',31478963);
INSERT INTO `cooking`.`fournisseurs` (`nom_f`,`numtel`) VALUES ('Luxe',1348650);

-- (4) insertion dans la table produit
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`,`matiere`, `stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('boeuf', 'viande','solide', 30,10,50, 'Boucherie');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('poulet', 'viande','solide', 30,10,50,'Boucherie');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`,`matiere`, `stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('fromage', 'laitage et frais','poudre',3000,1000,5000, 'Cremier');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('oeuf', 'laitage et frais','solide',30,10,50, 'Cremier');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('lait', 'laitage et frais', 'liquide',15000, 1000, 10000, 'Cremier');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`,`matiere`, `stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('carotte', 'Fruit et légume','poudre', 4500,500,3000,'Maraichais');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('tomate', 'Fruit et légume','solide',40,10,100,'Maraichais');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('mais', 'Fruit et légume','poudre', 1500,100,10000,'Maraichais');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('salade', 'Fruit et légume','poudre', 7500,2000,10000,'Maraichais');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('comcombre', 'Fruit et légume','poudre', 1500,1000,10000,'Maraichais');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('fraise', 'Fruit et légume','poudre', 2000,1500,10000,'Maraichais');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('framboise', 'Fruit et légume','poudre', 200,1000,10000,'Maraichais');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('orange', 'Fruit et légume','solide', 20,10,50,'Maraichais');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('banane', 'Fruit et légume', 'solide',20,10,30,'Maraichais');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('sucre', 'épicerie sucrée', 'poudre',2500,100,3000,"Bonbon");
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('chocolat', 'épicerie sucrée','poudre', 1200,1000,3000,"Bonbon");
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('vanille', 'épicerie sucrée','poudre', 200,100,300,"Bonbon");
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('patate', 'Fruit et légume','poudre', 20000,1000,30000,'Maraichais');
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('caviar', 'Epicerie fine','poudre',1,1,4,"Luxe");
INSERT INTO `cooking`.`produit` (`nom_p`,`categorie`, `matiere`,`stock`, `stock_min`, `stock_max`, `nom_f`) VALUES ('pain épice', 'Epicerie fine','poudre',1,1,4,"Luxe");

-- (5) insertion dans la table recette
INSERT INTO `cooking`.`recette` (`nom_r`, `type`, `descriptif`, `prix`, `id`) VALUES ('Salade colorée', 'entrée', 'juste plein de couleur', 15,'DAX');
INSERT INTO `cooking`.`recette` (`nom_r`, `type`, `descriptif`, `prix`, `id`) VALUES ('Salade fruitée', 'dessert', 'dessert très frais', 18,'DAX');
INSERT INTO `cooking`.`recette` (`nom_r`, `type`, `descriptif`, `prix`, `id`) VALUES ('Steak frite', 'plat', 'plat comestible', 25,'CAC40');
INSERT INTO `cooking`.`recette` (`nom_r`, `type`, `descriptif`, `prix`, `id`) VALUES ('Poulet salade', 'plat', 'mieux que la caesar', 23,'NISSEI');
INSERT INTO `cooking`.`recette` (`nom_r`, `type`, `descriptif`, `prix`, `id`) VALUES ('Salade caesar', 'plat', 'salade classique', 21,'DOWJONES');

-- (6) insertion dans la table recette
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade colorée','salade',150);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade colorée','mais',50);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade colorée','comcombre',50);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade colorée','tomate',1);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade fruitée','fraise',100);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade fruitée','framboise',40);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade fruitée','orange',1);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade fruitée','banane',1);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Steak frite','boeuf',1);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Steak frite','patate',300);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Poulet salade','poulet',2);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Poulet salade','salade',100);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Poulet salade','tomate',1);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade caesar','poulet',1);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade caesar','salade',100);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade caesar','tomate',1);
INSERT INTO `cooking`.`composer` (`nom_r`, `nom_p`, `quantite`) VALUES ('Salade caesar','oeuf',2);

-- (7) insertion dans la table commande
INSERT INTO `cooking`.`commander` (`nom`, `nom_r`, `num_c`,`periode`) VALUES ('Boon','Steak frite',1,'2020-01-01');
INSERT INTO `cooking`.`commander` (`nom`, `nom_r`, `num_c`,`periode`) VALUES ('Pierre','Steak frite',2,'2020-01-02');
INSERT INTO `cooking`.`commander` (`nom`, `nom_r`, `num_c`,`periode`) VALUES ('Boon','Salade caesar',3,'2020-01-21');
INSERT INTO `cooking`.`commander` (`nom`, `nom_r`, `num_c`,`periode`) VALUES ('General','Salade colorée',3,'2020-04-21');
INSERT INTO `cooking`.`commander` (`nom`, `nom_r`, `num_c`,`periode`) VALUES ('Boon','Salade caesar',3,'2020-01-21');