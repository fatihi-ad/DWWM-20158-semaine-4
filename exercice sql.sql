--- exercice 1

SELECT * 
FROM client
WHERE cli_prenom = 'Muriel'
ORDER by cli_nom ASC

--- exercice 2

SELECT cli_prenom, cli_password
FROM client 
WHERE cli_prenom = 'Muriel' AND cli_password = SHA1('test11')  


--- exercice 3 group by  having Count (pour compter le nombre de produit)
--- avoir au final le nombre de produit commandé plus qu'une fois
SELECT COUNT(*) AS 'nbre_fois_commande', com_lig_nom 
FROM commande_ligne 
GROUP BY com_lig_nom 
HAVING COUNT(*) > 1 

--- exercice 4
UPDATE commande_ligne
SET com_lig_prix_total = (com_lig_prix_unitaire*commande_ligne.com_lig_quantite)

--- exercice 5
SELECT com_reference, com_date_achat, com_cache_prix_total
FROM commande

--- exercice 6
SELECT cli_nom, cli_prenom, com_reference, com_date_achat, com_cache_prix_total
FROM commande
JOIN client



--- exercice 7
UPDATE commande 
SET com_cache_prix_total = 
(SELECT SUM(com_lig_prix_total) 
FROM commande_ligne 
WHERE com_lig_com_id = com_id)

--- exercice 8

SELECT YEAR(`com_date_achat`), MONTH(`com_date_achat`), SUM(`com_cache_prix_total`) 
FROM `commande` 
GROUP BY YEAR(`com_date_achat`), MONTH(`com_date_achat`)
ORDER BY YEAR(`com_date_achat`), MONTH(`com_date_achat`)

--- exercice 9 

SELECT client.cli_nom, client.cli_prenom, SUM(commande.com_cache_prix_total) AS client_montant
FROM `commande` 
LEFT JOIN client ON client.cli_id = commande.com_cli_id
GROUP BY commande.com_cli_id
ORDER BY client_montant DESC
LIMIT 10

--- exercice 10

SELECT `com_date_achat`, SUM(`com_cache_prix_total`) 
FROM `commande` 
GROUP BY `com_date_achat`

--- exercice 11

CREATE TABLE categorie
(
    cat_id INT PRIMARY KEY NOT NULL,
    cat_nom VARCHAR(100)
 )


