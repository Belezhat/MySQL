/* La liste des motos (nom, vendeur, quantité et marge) triés par marge décroissante */
SELECT `productName`, `productVendor`, `quantityInStock`, ROUND(`MSRP` - `buyPrice`, 2) AS `marge`
FROM `products`
WHERE `productLine` = "Motorcycles"
ORDER BY `marge` DESC;

/* La liste des commandes (numéro, date de commande, date d'expédition, 
écart en jours entre les deux dates et statut) qui sont en cours de 
traitement ou qui ont été expédiées et ont un écart de plus de 10j triés 
par écart décroissant puis par date de commande */
/* RESULTAT ==> 7  lignes / commande 10165 */
SELECT `orderNumber`, `orderDate`, `shippedDate`, DATEDIFF(`shippedDate`, `orderDate`) AS `ecart`, `status`
FROM `orders`
WHERE `status` = 'In process' OR (`status` = 'Shipped' AND DATEDIFF(`shippedDate`, `orderDate`) >= 10)
ORDER BY `ecart` DESC, `orderDate`;


/* La liste des produits (nom et valeur du stock à la vente) des années 1960 */
/* RESULTAT ==> 16 lignes / 1969 Harley Davidson Ultimate Chopper */
SELECT `productName`, ROUND(`quantityInStock` * `MSRP`, 2) AS `total`
FROM `products`
WHERE `productName` LIKE "196%";
