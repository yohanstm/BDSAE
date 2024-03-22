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
select num_form, fil_lib_voe_acc, select_form, num_fili, fili from FORMATION 
natural join FILIERE 
natural join VOEUX 
natural join ETABLISSEMENT 
natural join STATS 
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
select distinct cod_uai, g_ea_lib_vx, ville_etab, fili from ETABLISSEMENT 
natural join DEPARTEMENT
natural join FORMATION 
natural join FILIERE
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
SELECT cod_uai, g_ea_lib_vx, ville_etab, nb_cla_pp from ETABLISSEMENT 
natural join VOEUX 
natural join FORMATION 
natural join STATS
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
SELECT cod_uai, g_ea_lib_vx, ville_etab from ETABLISSEMENT 
natural join DEPARTEMENT
where dep_lib = 'Gironde' and contrat_etab = 'Public'and g_ea_lib_vx LIKE '%Lycée agricole%';


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
SELECT dep, dep_lib FROM DEPARTEMENT
natural join ETABLISSEMENT
natural join FORMATION
natural join FILIERE 
WHERE fili <> 'Licence' group by dep;


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
SELECT cod_uai, g_ea_lib_vx, ville_etab FROM ETABLISSEMENT
WHERE cod_uai IN (SELECT DISTINCT cod_uai FROM ETABLISSEMENT NATURAL JOIN VOEUX natural join FORMATION NATURAL JOIN FILIERE WHERE fil_lib_voe_acc='Droit') 
AND 
cod_uai IN (SELECT DISTINCT cod_uai FROM ETABLISSEMENT NATURAL JOIN VOEUX natural join FORMATION NATURAL JOIN FILIERE WHERE fil_lib_voe_acc = 'Informatique');



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
SELECT cod_uai, g_ea_lib_vx, ville_etab
FROM ETABLISSEMENT
natural join DEPARTEMENT
NATURAL JOIN VOEUX
NATURAL JOIN FORMATION
NATURAL JOIN FILIERE
NATURAL JOIN ACADEMIE
WHERE acad_mies = 'Versailles'
and fili = 'Licence' 
GROUP BY cod_uai, g_ea_lib_vx, ville_etab;



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
select acad_mies, count(contrat_etab)AS nb_et from ETABLISSEMENT 
natural join ACADEMIE 
where contrat_etab = 'Public' group by acad_mies;


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
SELECT REGION.region_etab_aff, COUNT(VOEUX.num_voe) AS nb_voe_but FROM REGION
NATURAL JOIN DEPARTEMENT
NATURAL JOIN ETABLISSEMENT
NATURAL JOIN VOEUX
NATURAL JOIN FORMATION
NATURAL JOIN FILIERE
NATURAL JOIN STATS
WHERE FILIERE.fili = 'Licence' AND STATS.session = 2023
GROUP BY REGION.region_etab_aff;



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

SELECT cod_uai, g_ea_lib_vx, ville_etab, fili, nb_voe_pp from ETABLISSEMENT 
NATURAL JOIN VOEUX 
NATURAL JOIN STATS
NATURAL JOIN FORMATION
NATURAL JOIN FILIERE WHERE session = 2023 group by cod_uai, g_ea_lib_vx, ville_etab, fili
ORDER BY count(nb_voe_pp) desc limit 1;


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


select acad_mies from ACADEMIE
natural join DEPARTEMENT
natural join STATS group by acad_mies
having (select sum(capa_fin) from STATS where session = 2022) > (select sum(capa_fin) from STATS where session = 2023);


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

SELECT fili, COUNT(fil_lib_voe_acc) AS nb_form FROM FILIERE
NATURAL JOIN FORMATION
NATURAL JOIN VOEUX
NATURAL JOIN STATS 
WHERE session = 2023 GROUP BY fili;




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
SELECT fili, count(distinct nb_voe_pp) AS nb_voeux FROM FILIERE
NATURAL JOIN FORMATION 
NATURAL JOIN VOEUX 
NATURAL JOIN STATS
WHERE session = 2023 AND select_form = 'formation selective' GROUP BY fili;




