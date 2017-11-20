USE gamenote;
INSERT INTO USER (nom, prenom, pseudo, age, email, password) 
VALUES ('antoine', 'delmare', 'antodel43', 23, 'antodel43@gmail.com', 'azerty'),
('bernard', 'sizler', 'bsizler75', 45, 'btnzdjssdf@gmail.com', 'azerty'),
('carlos', 'taranta', 'carlostar55', 26, 'totoaeor@gmail.com', 'azerty'), 
('david', 'robesspierre', 'davidogR', 28, 'dedzedsdgsdse@gmail.com', 'azerty');

INSERT INTO CRITERE (idCRITERE, critere)
VALUES (1, 'graphisme'),
(2, 'gameplay'),
(3, 'lifetime');

INSERT INTO PEGI (pegi)
VALUES ('pegi3'),
('pegi12'),
('pegi16');

INSERT INTO EDITEUR (nom_editeur)
VALUES ('UBISOFT'),
('VALVE'),
('ACTIVISON'),
('BLIZZARD');

INSERT INTO SUPPORT (name)
VALUES ('Windows7'),
('W10'),
('Windows8_pro'),
('Android5.1'),
('mac_osx'),
('Linux'),
('Xbox'),
('PS4');

INSERT INTO GENRE (genre)
VALUES ('FPS'),
('RPG'),
('simulation'),
('A-RPG'),
('GTA-like'),
('GORE-LIKE');

INSERT INTO JEUX (nom, idEDITEUR, idPEGI)
VALUES ('doom4', 1, 1),
('GTA VI', 1, 1),
('NeedForSPeed 10', 1, 1),
('Call of Duty', 2, 2),
('World of warcraft', 4, 1);

INSERT INTO JEUX_has_GENRE (JEUX_idJEUX, GENRE_idGENRE)
VALUES (1, 1),
(1, 6),
(2, 5),
(3, 3);

INSERT INTO JEUX_has_SUPPORT (JEUX_idJEUX, SUPPORT_idSUPPORT, date_sortie)
VALUES (1, 1, '2012-04-11'),
(2,1, '2012-04-11'),
(2,3, '2012-05-11'),
(2,4, '2012-06-11'),
(3,5, '2012-06-11'),
(3,4, '2011-06-11'),
(3,3, '2013-04-09'),
(3,1, '2014-10-10'),
(3,2, '2013-08-01'),
(2,2, '2014-07-07');

INSERT INTO NOTE (note, commentaire, idUSER, idJEUX, idCRITERE, idSUPPORT)
VALUES 
#USER 1 notes et commentaires
(3, "super graphisme", 1, 1, 1, 1),
(4, "super jeux", 1, 1, 2, 1),
(5, "durée de jeux super longue", 1, 1, 3, 1),

(5, "super graphisme", 1, 3, 1, 1),
(5, "super jeux", 1, 3, 2, 1),
(5, "durée de jeux super longue", 1, 3, 3, 1),

(5, "pareil super graphisme", 1, 3, 1, 3),
(5, "idemsuper jeux", 1, 3, 2, 3),
(5, "Sur ce support pareil durée de jeux super longue", 1, 3, 3, 3),

#USER 2 notes et commentaires
(1, "mauvaise qualité graphique", 2, 2, 1, 2),
(1, "super jeux", 2, 2, 2, 2),
(3, "durée de jeux trop longue relou !", 2, 2, 3, 2),

(4, "super graphisme", 2, 3, 1, 1),
(5, "super jeux", 2, 3, 2, 1),
(4, "durée de jeux super longue", 2, 3, 3, 1),

#USER 3 notes et commentaires 
(1, "mauvaise qualité graphique", 3, 2, 1, 2),
(1, "super jeux", 3, 2, 2, 2),
(3, "durée de jeux trop longue relou !", 3, 2, 3, 2),

(4, "super graphisme", 3, 3, 1, 1),
(5, "super jeux", 3, 3, 2, 1),
(4, "durée de jeux super longue", 3, 3, 3, 1),

(4, "super graphisme", 3, 3, 1, 3),
(5, "super jeux", 3, 3, 2, 3),
(4, "durée de jeux super longue", 3, 3, 3, 3);