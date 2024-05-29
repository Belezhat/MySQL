/* La liste des bureaux (adresse et ville) triés par pays décroissant puis par état */
/* RESULTAT ==> 7 lignes / 100 Market Street */
SELECT addressLine1, addressLine2, city
FROM offices
WHERE address = '100 Market Street'
ORDER BY country DESC, state;