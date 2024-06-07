-- Top 20 des produits (Produit, Pièces vendues) 

-- Sélectionner les noms des produits et le nombre total de pièces vendues pour chaque produit 
SELECT products.productName, SUM(orderdetails.quantityOrdered) AS soldPieces
FROM orderdetails
-- Jointure avec la table products pour obtenir les informations sur les produits 
JOIN products ON products.productCode = orderdetails.productCode
-- Grouper par nom de produit pour obtenir les totaux par produit 
GROUP BY products.productName;
-- Trier par le nombre de pièces vendues en ordre décroissant et limiter aux 20 premiers produits 
ORDER BY soldPieces DESC
LIMIT 20;

-- Catégories (Nombre de produits par catégorie) 

-- Sélectionner les lignes de produits et compter le nombre de produits dans chaque ligne 
SELECT productLine, COUNT(*) AS productsCount
FROM products
GROUP BY productline;

-- Top 5 des vendeurs (Classement, Nom/Prénom, Bureau, Chiffre d'affaire) 

-- Sélectionner le nom complet des vendeurs, leur bureau et le chiffre d'affaires total généré par chaque vendeur 
SELECT `employees`.`employeeNumber`, 
`employees`.`lastName`, //
`employees`.`firstName`,
`offices`.`city`, 
-- Calcule et arrondit le chiffre d'affaires total généré par l'employé 
ROUND(SUM(`orderdetails`.`quantityOrdered` * `orderdetails`.`priceEach`), 2) AS `ca`
-- La table principale de la requête est `employees` 
FROM `employees`
-- Jointure avec la table `offices` pour obtenir les informations sur les bureaux des employés 
JOIN `offices` ON `offices`.`officeCode` = `employees`.`officeCode`
-- Jointure avec la table `customers` pour obtenir les informations sur les clients 
JOIN `customers` ON `employees`.`employeeNumber` = `customers`.`salesRepEmployeeNumber`
-- Jointure avec la table `orders` pour obtenir les informations sur les commandes des clients 
JOIN `orders` ON `customers`.`customerNumber` = `orders`.`customerNumber`
-- Grouper les résultats par numéro d'employé pour calculer le chiffre d'affaires total par employé 
JOIN `orderdetails` ON `orders`.`orderNumber` = `orderdetails`.`orderNumber` 
-- Grouper les résultats par numéro d'employé pour calculer le chiffre d'affaires total par employé 
GROUP BY `employees`.`employeeNumber`
-- Trier les résultats par chiffre d'affaires décroissant */
ORDER BY `ca` DESC
-- Limiter les résultats aux 5 premiers employés ayant généré le plus de chiffre d'affaires 
LIMIT 5;

-- Top 3 des clients (Client, Chiffre d'affaire) 

-- Sélectionner le nom des clients et le chiffre d'affaires total généré par chaque client 
SELECT `customers`.`customerName`, ROUND(SUM(`orderdetails`.`quantityOrdered` * `orderdetails`.`priceEach`), 2) AS `ca`
FROM `orderdetails`
JOIN `orders` ON `orders`.`orderNumber` = `orderdetails`.`orderNumber`
JOIN `customers` ON `customers`.`customerNumber` = `orders`.`customerNumber`
GROUP BY `customers`.`customerName`
ORDER BY `ca` DESC
LIMIT 3;

-- Articles presque épuisés (Produit, Catégorie, Échelle, Pièces restantes) 

-- Sélectionner les noms des produits, leur catégorie, échelle, et le nombre de pièces restantes 
SELECT `products`.`productName`, `products`.`productLine`, `products`.`productScale`, `products`.`quantityInStock`
FROM `products`
-- Filtrer pour montrer seulement les produits ayant moins de 200 pièces en stock 
WHERE `products`.`quantityInStock` < 200;