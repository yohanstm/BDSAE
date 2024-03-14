-- Devoir 211
-- Nom: SAINT MARC , Prenom: Yohan

-- Feuille SAE2.04 Exploitation d'une base de donn�es
-- 
-- Veillez � bien r�pondre aux emplacements indiqu�s.
-- Seule la premi�re requ�te est prise en compte.

-- +-----------------------+--
-- * Question 211442 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Quelles sont les formations offertes par l'IUT d'Orl�ans en 2023? On veut le num�ro de formation, la fili�re, le nom (fil_lib_voe_acc)

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------------------------------+---------------------+----------+-------------------+
-- | num_form | fil_lib_voe_acc                                          | select_form         | num_fili | fili              |
-- +----------+----------------------------------------------------------+---------------------+----------+-------------------+
-- | etc...
-- = Reponse question 211442.
select num_form, fil_lib_voe_acc, select_form, num_fili, fili 
from FORMATION natural join FILIERE natural join VOEUX natural join ETABLISSEMENT natural join STATS 
where session =2023 and g_ea_lib_vx = "I.U.T d'Orléans" and fili = 'BUT';



-- +-----------------------+--
-- * Question 211475 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Quels sont les �tablissements de la Creuse qui offrent un BTS? On veut le code uai, le nom de l'�tablissement ( g_ea_lib_vx) et la ville.

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------+------------+------+
-- | cod_uai  | g_ea_lib_vx                      | ville_etab | FILI |
-- +----------+----------------------------------+------------+------+
-- | etc...
-- = Reponse question 211475.
select distinct cod_uai, g_ea_lib_vx, ville_etab, fili
from ETABLISSEMENT natural join DEPARTEMENT natural join FORMATION natural join FILIERE
where dep_lib ='Creuse' and fili ='BTS';


-- +-----------------------+--
-- * Question 211486 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Combien de candidats ont �t� class�s lors de la phase principale de 2023 par les diff�rents �tablissements qui d�livrent le BUT QLIO? On veut le code uai, le nom et la ville de l'�tablissement et le nombre de class�s lors de la phase principale (nb_cla_pp)

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+-----------------------------------------------------+--------------------+-----------+
-- | cod_uai  | g_ea_lib_vx                                         | ville_etab         | nb_cla_pp |
-- +----------+-----------------------------------------------------+--------------------+-----------+
-- | etc...
-- = Reponse question 211486.
SELECT cod_uai, g_ea_lib_vx, ville_etab, nb_cla_pp from ETABLISSEMENT natural join VOEUX natural join FORMATION natural join STATS
where session = 2023 and  fil_lib_voe_acc = 'Qualité, logistique industrielle et organisation' ;


-- * Question 211521 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  La liste des lyc�es agricoles publics de la Gironde

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------------+-------------+
-- | cod_uai  | g_ea_lib_vx                            | ville_etab  |
-- +----------+----------------------------------------+-------------+
-- | etc...
-- = Reponse question 211521.
SELECT cod_uai, g_ea_lib_vx, ville_etab from ETABLISSEMENT natural join DEPARTEMENT
where dep_lib = 'Gironde' and contrat_etab = 'Public' LIKE '%agricole';

-- +-----------------------+--
-- * Question 211565 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des d�partements dans lesquels il n'y a aucune offre de Licence

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-----+-------------------------+
-- | dep | dep_lib                 |
-- +-----+-------------------------+
-- | etc...
-- = Reponse question 211565.
SELECT DEPARTEMENT.dep, DEPARTEMENT.dep_lib
FROM DEPARTEMENT
WHERE NOT EXISTS (
    SELECT *
    FROM FORMATION
    WHERE FORMATION.dep = DEPARTEMENT.dep AND fili = 'Licence'
);


-- +-----------------------+--
-- * Question 211576 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des �tablissements qui offrent � la fois une licence de Droit et une licence informatique

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+--------------------------------------------------------------+----------------+
-- | cod_uai  | g_ea_lib_vx                                                  | ville_etab     |
-- +----------+--------------------------------------------------------------+----------------+
-- | etc...
-- = Reponse question 211576.
SELECT DISTINCT E1.cod_uai, E1.g_ea_lib_vx, E1.ville_etab
FROM ETABLISSEMENT E1
JOIN FORMATION F1 ON E1.cod_uai = F1.cod_uai AND F1.fili = 'Droit'
JOIN ETABLISSEMENT E2 ON E1.cod_uai = E2.cod_uai
JOIN FORMATION F2 ON E2.cod_uai = F2.cod_uai AND F2.fili = 'Informatique';


-- +-----------------------+--
-- * Question 211622 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des �tablissements de l'acad�mie de Versailles qui n'offrent que des Licences

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+---------------------------------------------------------------------------------+---------------------+
-- | cod_uai  | g_ea_lib_vx                                                                     | ville_etab          |
-- +----------+---------------------------------------------------------------------------------+---------------------+
-- | etc...
-- = Reponse question 211622.
SELECT E1.cod_uai, E1.g_ea_lib_vx, E1.ville_etab
FROM ETABLISSEMENT E1
JOIN ACADEMIE A ON E1.cod_aca = A.cod_aca AND A.aca_lib = 'Versailles'
WHERE NOT EXISTS (
    SELECT *
    FROM FORMATION F
    WHERE F.cod_uai = E1.cod_uai AND F.fili != 'Licence'
);


-- +-----------------------+--
-- * Question 211677 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner le nombre d'�tablissements publics par acad�mie

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +---------------------+-------+
-- | acad_mies           | nb_et |
-- +---------------------+-------+
-- | etc...
-- = Reponse question 211677.
SELECT A.aca_lib AS acad_mies, COUNT(E.cod_uai) AS nb_et
FROM ACADEMIE A
LEFT JOIN ETABLISSEMENT E ON A.cod_aca = E.cod_aca AND E.contrat_etab = 'Public'
GROUP BY A.aca_lib;


-- +-----------------------+--
-- * Question 211712 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner le nombre total de candidatures en licence en 2023 par r�gion

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------------------------+------------+
-- | region_etab_aff            | nb_voe_but |
-- +----------------------------+------------+
-- | etc...
-- = Reponse question 211712.
SELECT R.region_etab_aff, COUNT(V.cod_voe) AS nb_voe_but
FROM REGION R
LEFT JOIN ETABLISSEMENT E ON R.cod_reg = E.cod_reg
LEFT JOIN VOEUX V ON E.cod_uai = V.cod_uai AND V.session = 2023 AND V.select_form = 'BUT'
WHERE E.fili = 'Licence'
GROUP BY R.region_etab_aff;


-- +-----------------------+--
-- * Question 211756 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la ou les formations qui ont re�u le plus de voeux en phase principale en 2023

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+-------------+--------------+-------------------+-----------+
-- | cod_uai  | g_ea_lib_vx | ville_etab   | fili              | nb_voe_pp |
-- +----------+-------------+--------------+-------------------+-----------+
-- | etc...
-- = Reponse question 211756.
SELECT E.cod_uai, E.g_ea_lib_vx, E.ville_etab, F.fili, COUNT(V.cod_voe) AS nb_voe_pp
FROM ETABLISSEMENT E
JOIN FORMATION F ON E.cod_uai = F.cod_uai
JOIN VOEUX V ON F.num_form = V.num_form AND V.session = 2023 AND V.select_form = 'BUT'
WHERE V.phase_voeu = 'Principale'
GROUP BY E.cod_uai, F.fili
ORDER BY nb_voe_pp DESC
LIMIT 1;


-- +-----------------------+--
-- * Question 211802 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des acad�mies qui ont offert plus de places en 2022 qu'en 2023

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +---------------------+
-- | acad_mies           |
-- +---------------------+
-- | etc...
-- = Reponse question 211802.
SELECT A.aca_lib
FROM ACADEMIE A
JOIN ETABLISSEMENT E ON
-- +---------------------+
-- | acad_mies           |
-- +---------------------+
-- | etc...
-- = Reponse question 211802.
SELECT A.aca_lib
FROM ACADEMIE A
JOIN ETABLISSEMENT E ON A.cod_aca = E.cod_aca
JOIN FORMATION F ON E.cod_uai = F.cod_uai
WHERE F.session = 2022
GROUP BY A.aca_lib
HAVING SUM(F.capacite_form) > (
    SELECT SUM(F2.capacite_form)
    FROM FORMATION F2
    WHERE F2.session = 2023
);


-- +-----------------------+--
-- * Question 211857 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Requ�te pour le 1er graphique

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-------------------+---------+
-- | fili              | nb_form |
-- +-------------------+---------+
-- | etc...
-- = Reponse question 211857.
SELECT F.fili, COUNT(F.num_form) AS nb_form
FROM FORMATION F
GROUP BY F.fili
ORDER BY nb_form DESC;


-- +-----------------------+--
-- * Question 211879 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Requ�te pour le 2eme graphique

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-------------------+----------+
-- | filiere           | nb_voeux |
-- +-------------------+----------+
-- | etc...
-- = Reponse question 211879.
SELECT F.filiere, COUNT(V.cod_voe) AS nb_voeux
FROM VOEUX V
JOIN FORMATION F ON V.num_form = F.num_form
GROUP BY F.filiere
ORDER BY nb_voeux DESC;
