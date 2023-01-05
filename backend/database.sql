
DROP DATABASE IF EXISTS externatic;
CREATE DATABASE externatic;
USE externatic;
CREATE TABLE `user` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `role_id` int  NOT NULL ,
    `gender` VARCHAR(50)  NULL ,
    `firstname` VARCHAR(50)  NOT NULL ,
    `lastname` VARCHAR(50)  NOT NULL ,
    `email` VARCHAR(50)  NOT NULL ,
    `city` VARCHAR(100)  NOT NULL ,
    `postal_code` int  NULL ,
    `country` VARCHAR(100)  NULL ,
    `adress` VARCHAR(100)  NULL ,
    `phone` VARCHAR(100)  NULL ,
    `isActive` BOOLEAN  NOT NULL DEFAULT FALSE,
    `linkedin` VARCHAR(100)  NULL ,
    `website` VARCHAR(100)  NULL ,
    `github` VARCHAR(100)  NULL ,
    `actual_job` VARCHAR(100)  NULL ,
    `job_id` int  NOT NULL ,
    `salary` int  NULL ,
    `diploma` VARCHAR(200)  NULL ,
    `handicap` BOOLEAN  NOT NULL DEFAULT FALSE,
    `password` VARCHAR(100)  NOT NULL ,
    `hard_skills` VARCHAR(500)  NULL ,
    `experience_id` int  NULL ,
    `contract_id` int  NULL ,
    `consultant_id` int  NULL ,
    `userNote` VARCHAR(1000)  NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `admin` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `role_id` int  NOT NULL ,
    `gender` VARCHAR(50)  NOT NULL ,
    `firstname` VARCHAR(50)  NOT NULL ,
    `lastname` VARCHAR(50)  NOT NULL ,
    `email` VARCHAR(40)  NOT NULL ,
    `password` VARCHAR(100)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `consultant` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `role_id` int  NOT NULL ,
    `firstname` VARCHAR(30)  NOT NULL ,
    `lastname` VARCHAR(30)  NOT NULL ,
    `phone` VARCHAR(100)  NOT NULL ,
    `city` VARCHAR(100)  NOT NULL ,
    `email` VARCHAR(40)  NOT NULL ,
    `password` VARCHAR(100)  NOT NULL ,
    `linkedin` VARCHAR(100)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `firm` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `email` VARCHAR(100)  NOT NULL ,
    `password` VARCHAR(100)  NOT NULL ,
    `name` VARCHAR(50)  NOT NULL ,
    `contact_phone` VARCHAR(100)  NOT NULL ,
    `city` VARCHAR(100)  NULL ,
    `postal_code` int  NOT NULL ,
    `country` VARCHAR(100)  NOT NULL ,
    `adress` VARCHAR(60)  NOT NULL ,
    `type` VARCHAR(100)  NOT NULL ,
    `logo_url` VARCHAR(150)  NOT NULL ,
    `consultant_id` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `role` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `status` VARCHAR(60)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `job` (
    `id` int AUTO_INCREMENT NOT NULL ,
     `category` VARCHAR(300)  NOT NULL ,
    `job_title` VARCHAR(300)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `experience` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `experience` VARCHAR(50)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `offer` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `title` VARCHAR(100)  NOT NULL ,
    `firm_id` int  NOT NULL ,
    `firm_city` VARCHAR(500)  NULL ,
    `date` DATE  NOT NULL ,
    `postal_code` int  NOT NULL ,
    `country` VARCHAR(500)  NOT NULL ,
    `job_id` int  NOT NULL ,
    `salary` VARCHAR(500)  NULL ,
    `description_firm` VARCHAR(500)  NOT NULL ,
    `description_mission` VARCHAR(500)  NOT NULL ,
    `soft_skills` VARCHAR(500)  NOT NULL ,
    `hard_skills` VARCHAR(500)  NOT NULL ,
    `experience_id` int  NOT NULL ,
    `contract_type` int  NOT NULL ,
    `consultant_id` int  NOT NULL ,
    `urgency_id` int  NOT NULL ,
    `state_offer_id` int  NOT NULL ,

    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `userOffer` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `isFavorite` BOOLEAN  NOT NULL DEFAULT FALSE ,
    `candidated` BOOLEAN  NOT NULL DEFAULT FALSE,
    `offer_id` int  NOT NULL ,
    `user_id` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `contract` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `contract_type` VARCHAR(100)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `urgency` (
	`id` INT auto_increment NOT NULL,
	`urgency_type` varchar(100) NOT NULL,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `state_offer` (
	`id` INT auto_increment NOT NULL,
	`type_state` varchar(100) NOT NULL,
	PRIMARY KEY (
        `id`
    )
);


ALTER TABLE `user` ADD CONSTRAINT `fk_user_role_id` FOREIGN KEY(`role_id`)
REFERENCES `role` (`id`);
ALTER TABLE `user` ADD CONSTRAINT `fk_user_job_id` FOREIGN KEY(`job_id`)
REFERENCES `job` (`id`);
ALTER TABLE `user` ADD CONSTRAINT `fk_user_experience_id` FOREIGN KEY(`experience_id`)
REFERENCES `experience` (`id`);
ALTER TABLE `user` ADD CONSTRAINT `fk_user_contract_id` FOREIGN KEY(`contract_id`)
REFERENCES `contract` (`id`);
ALTER TABLE `user` ADD CONSTRAINT `fk_user_consultant_id` FOREIGN KEY(`consultant_id`)
REFERENCES `consultant` (`id`);
ALTER TABLE `admin` ADD CONSTRAINT `fk_admin_role_id` FOREIGN KEY(`role_id`)
REFERENCES `role` (`id`);
ALTER TABLE `consultant` ADD CONSTRAINT `fk_consultant_role_id` FOREIGN KEY(`role_id`)
REFERENCES `role` (`id`);
ALTER TABLE `firm` ADD CONSTRAINT `fk_firm_consultant_id` FOREIGN KEY(`consultant_id`)
REFERENCES `consultant` (`id`);
ALTER TABLE `offer` ADD CONSTRAINT `fk_offer_firm_id` FOREIGN KEY(`firm_id`)
REFERENCES `firm` (`id`);
ALTER TABLE `offer` ADD CONSTRAINT `fk_offer_job_id` FOREIGN KEY(`job_id`)
REFERENCES `job` (`id`);
ALTER TABLE `offer` ADD CONSTRAINT `fk_offer_experience_id` FOREIGN KEY(`experience_id`)
REFERENCES `experience` (`id`);
ALTER TABLE `offer` ADD CONSTRAINT `fk_offer_contract_type` FOREIGN KEY(`contract_type`)
REFERENCES `contract` (`id`);
ALTER TABLE `offer` ADD CONSTRAINT `fk_offer_consultant_id` FOREIGN KEY(`consultant_id`)
REFERENCES `consultant` (`id`);
ALTER TABLE `offer` ADD CONSTRAINT `fk_offer_urgency_id` FOREIGN KEY(`urgency_id`)
REFERENCES `urgency` (`id`);
ALTER TABLE `offer` ADD CONSTRAINT `fk_offer_state_offer_id` FOREIGN KEY(`state_offer_id`)
REFERENCES `state_offer` (`id`);

ALTER TABLE `userOffer` ADD CONSTRAINT `fk_userOffer_offer_id` FOREIGN KEY(`offer_id`)
REFERENCES `offer` (`id`);

ALTER TABLE `userOffer` ADD CONSTRAINT `fk_userOffer_user_id` FOREIGN KEY(`user_id`)
REFERENCES `user` (`id`);

INSERT INTO role (status) VALUES('user');
INSERT INTO role (status) VALUES('consultant');
INSERT INTO role (status) VALUES('admin');


INSERT INTO job (category, job_title) VALUES ('Technologies','Développeur Back End'), ('Technologies','Développeur Front End'), ('Technologies','Développeur Full Stack'), ('Technologies','DevOps'), ('Technologies','Lead technique'), ('Technologies','Architecte Infrastructure'), ('Technologies','Scrum master'), ('Technologies','Product owner'), ('Technologies','Product Manager'), ('Technologies','Ingénieur Test'), ('Technologies','UX / UI designer'),  ('Technologies','Administrateur Système  Réseaux'), ('Technologies','Ingénieur Système Cloud'),('Technologies','Architecte Logiciel'),('Technologies','Ingénieur Hardware'), ('Technologies','Analyste fonctionnel / AMOA'), ('Technologies','Intégrateur Web'), ('Technologies','Ingénieur Logiciel Embarqué'), ('Technologies','Technicien support'), ('Management / Marketing','Directeur du Système d Informations'), ('Management / Marketing','Directeur / chef de projet'), ('Management / Marketing','Directeur technique / CTO'), ('Management / Marketing','Responsable de la Sécurité du Système Informatique'), ('Management / Marketing','Directeur Marketing'),('Management / Marketing','Service Delivery Manager'),('Management / Marketing','Customer Success Manager'), ('Management / Marketing','Chief Operating Officer'), ('Management / Marketing','Business Developper'), ('Management / Marketing','Growth Hacker'), ('Management / Marketing','Expert SEO Trafic content Manager'), ('Management / Marketing','Chef de projet Web'), ('DATA','Data Architect'), ('DATA','Data Engineer'), ('DATA','Data Analyst'), ('DATA','Data Scientist'), ('Ressources humaines','Consultant en recrutement IT'), ('Ressources humaines','Recruteur tech');

INSERT INTO experience (experience) VALUES
     ('Debutant'),
     ('2-3 ans'),
     ('4-10 ans'),
     ('10 ans et +');

INSERT INTO consultant (role_id,firstname,lastname,phone,city,email,password,linkedin) VALUES
     (1,'Paul','Delos','0625456289','Bordeaux','pauldelos@gmail.com','avrtuyiop','https://www.linkedin.com/in/paul-delos/%27'),
     (1,'Jeremie','Cavanier','0625458978','Bordeaux','jeremiecavanier@gmail.com','256poulpom','https://www.linkedin.com/in/jeremie-cavanier/%27'),
     (2,'Claire ','Jacquier','0625694563','Pessac','clairejacquier@gmail.com','25mpelodpmpe','https://www.linkedin.com/in/claire-jacquier/%27'),
     (2,'Charlotte','Calier','0647852697','Cadillac','cha.calier@gmail.com','54789oopzmlpdo','https://www.linkedin.com/in/charlotte-calier/%27'),
     (1,'Romain','Permontade','0647859632','Bordeaux','romain.permontade@gmail.com','sampodjk41255','https://www.linkedin.com/in/romain-permontade/%27'),
     (2,'Ophelie','Gavernie','0796896321','Begles','opheliegaverie@gmail.com','gdteej#48569','https://www.linkedin.com/in/ophelie-gavernie/%27'),
     (1,'Bertrand','Pomelo','0769365478','Bordeaux','bertrandpomelo@gmail.com','89654derop#klmp','https://www.linkedin.com/in/bertrand-pomelo/%27'),
     (2,'Carole','Artelis','0658963250','Cauderan','carole.artelis@gmail.com','7856aldopme','https://www.linkedin.com/in/carole-artelis/%27');

     INSERT INTO firm (email, password, name, contact_phone, city, postal_code, country, adress, type, logo_url, consultant_id) 
VALUES('contact@betclic.com', 'password', 'Betclic Group', '05 10 20 30 40', 'Bordeaux', 33000, 'France', '117 Quai de Bacalan', 'IT', 'https://upload.wikimedia.org/wikipedia/fr/thumb/f/fe/Logo_Betclic_2019.svg/langfr-340px-Logo_Betclic_2019.svg.png', 1),
('contact@cdiscount.com', 'password', 'Cdiscount', '05 56 89 09 76', 'Bordeaux', 33000, 'France', '120-126 Quai de Bacalan', 'IT', 'https://upload.wikimedia.org/wikipedia/fr/thumb/7/74/Logo-Cdiscount-baseline.png/560px-Logo-Cdiscount-baseline.png', 2),
('contact@kwantic.com', 'password', 'Kwantic', '05 30 90 78 65', 'Bordeaux', 33000, 'France', '74 Rue Georges Bonnac', 'IT', 'https://kwantic.fr/wp-content/uploads/2022/01/logo-kwantic-noir-et-blanc-sur-jaune.svg', 3);

INSERT INTO externatic.admin (role_id,gender,firstname,lastname,email,password) VALUES
	 (3,1,'Michael','Birepinte','mickael.birepinte@gmail.com','Salut'),
	 (3,1,'Olga','Yasno','olga_yasn@hotmail.com','Coucou'),
	 (3,2,'Luc','Jaubert','lucjaubert@gmail.com','Pessac');

     INSERT INTO urgency (urgency_type) VALUES
	 ('faible'),
	 ('moyenne'),
	 ('forte'),
	 ('absolue');

     INSERT INTO state_offer (type_state) VALUES
	 ('En traitement'),
	 ('Pourvu'),
	 ('Clôturé'),
	 ('Suspendu'),
	 ('Abandonné');

     INSERT INTO contract (id, contract_type) VALUES(1, 'CDI'), (2, 'CDD'), (3, 'Stage'), (4, 'Contrat de professionnalisation'), (5, 'Contrat d apprentissage');

     INSERT INTO externatic.offer (title,
    firm_id,
    firm_city,
    date,
    postal_code,
   country,
    job_id,
    salary,
   description_firm,
    description_mission,
    soft_skills,
    hard_skills,
    experience_id,
    contract_type,
    consultant_id,
    urgency_id,
     state_offer_id 
) VALUES
	 ('Front-End Developpeur',1,'Bordeaux','2023-01-01','92000','France',2,'35000 €','Betclic Group est une société de conseil en technologies de l information et de la communication. Nous accompagnons nos clients dans la transformation digitale de leurs activités et de leurs processus métiers. Nous intervenons sur des projets de développement, d intégration, de déploiement et de maintenance de solutions informatiques','Gestion des anomalies remontées sur le périmètre technique dans le respect des engagements de service (délais) et des bonnes pratiques (qualité, sécurité) via l outil de ticketing, assurer et coordonner les demandes sur le périmètre technique, réalisation de l analyse technico-fonctionnelle avec les équipes de SI et du métier, participation à la conception et à la réalisation de la solution avec les équipes','Vous êtes curieux, force de proposition et avez le sens du service. Vous savez gérer les priorités, prendre des initiatives, et vous adapter à différents acteurs. Vous avez une capacité d écoute et d analyse et vous savez être force de proposition. Vous faites preuve d une bonne aisance rédactionnelle','Issu d une formation informatique vous avez une première expérience en développement sur SAGE X3',2, 1, 1, 1,1),
     ('Senior JAVA Developpeur', 2,'Bègles','2022-12-23','33130','France',2,'45000 €','Netfective Technology est une société de conseil en technologies de l information et de la communication. Nous accompagnons nos clients dans la transformation digitale de leurs activités et de leurs processus métiers. Nous intervenons sur des projets de développement, d intégration, de déploiement et de maintenance de solutions informatiques','Prendre en charge la conception, le développement, les tests et la documentation, participer aux phases d analyse, de recette et de mise en production, Assurer le support aux utilisateurs, corriger les dysfonctionnements et prendre en charge les évolutions, proposer des actions d optimisation des process et outils de développement','-','Connaissances requises en développement Web autour des technologies Java, HTML, CSS, Javascript, XSL, SQL',3, 1, 2, 2,1),
     ('PHP Developpeur', 3,'Bordeaux','2022-12-10','33000','France',2,'33000 €','Betclic Group est une société de conseil en technologies de l information et de la communication. Nous accompagnons nos clients dans la transformation digitale de leurs activités et de leurs processus métiers. Nous intervenons sur des projets de développement, d intégration, de déploiement et de maintenance de solutions informatiques','Gestion des anomalies remontées sur le périmètre technique dans le respect des engagements de service (délais) et des bonnes pratiques (qualité, sécurité) via l outil de ticketing, assurer et coordonner les demandes sur le périmètre technique, réalisation de l analyse technico-fonctionnelle avec les équipes de SI et du métier, participation à la conception et à la réalisation de la solution avec les équipes','Vous êtes curieux, force de proposition et avez le sens du service. Vous savez gérer les priorités, prendre des initiatives, et vous adapter à différents acteurs. Vous avez une capacité d écoute et d analyse et vous savez être force de proposition. Vous faites preuve d une bonne aisance rédactionnelle','Issu d une formation informatique vous avez une première expérience en développement sur SAGE X3',2, 1, 1, 1,2);
	

INSERT INTO externatic.`user` (role_id,gender,firstname,lastname,email,city,postal_code,country,adress,phone,isActive,linkedin,website,github,actual_job,job_id,salary,diploma,handicap,password,hard_skills,experience_id,contract_id,consultant_id,userNote) VALUES
	 (1,'homme','luc','thebest','lucthebest@gmail.com','Bordeaux',33000,'FRANCE','43 rue du loup','0640899345',1,'lebgdu33',NULL,NULL,'Developpeur',2,NULL,NULL,0,'test',NULL,NULL,NULL,1,NULL),
	 (1,'femme','josette','colin','josettecol@gmail.com','Nantes',44000,'FRANCE','5 rue du temple','0640899678',1,NULL,NULL,NULL,'chomage',3,NULL,NULL,0,'test',NULL,NULL,NULL,7,NULL),
	 (1,'homme','bertrand','molina','btr@gmail.com','soustons',40140,'FRANCE','8 rue des pins','0558411032',1,NULL,NULL,NULL,'boulanger',7,NULL,NULL,1,'test',NULL,NULL,NULL,8,NULL),
     (1,'homme','José','Garcia','j.garcia@gmail.com','Bordeaux',33000,'France',' 6 Alleé des platanes','0678294729',0,'j.garcia@linkedin.com','',NULL,'Développpeur Web',2,NULL,NULL,0,'test',NULL,1,NULL,1,NULL);