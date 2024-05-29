/* La liste des employés (nom, prénom et fonction) et des bureaux (adresse et ville) dans lequel ils travaillent */
/* RESULTAT ==> 23 lignes / Diane Murphy */
SELECT firstName, lastName, jobTitle
FROM employees
JOIN offices ON offices . officeCode = employees.officeCode


/* La liste des clients français ou américains (nom du client, nom, prénom du contact et pays) et de leur commercial dédié (nom et prénom) triés par nom et prénom du contact */
/* RESULTAT ==> 48 lignes / Miguel Barajas */

SELECT customerName, contactFirstName, contactLastName, country, firstName, lastName
FROM customers
JOIN employees ON employees.employeeNumber = customers.salesRepEmployeeNumber
WHERE customers.country IN ('France', 'USA')
ORDER BY customers.contactLastName, customers.contactFirstName;


/* La liste des lignes de commande (numéro de commande, code, nom et ligne de produit) et la remise appliquée aux voitures ou motos commandées triées par numéro de commande puis par remise décroissante */
/* RESULTAT ==> 2026 lignes / 34 */

SELECT orderNumber, productCode, productName, productLine, ROUND(MSRP - priceEach) AS remise
FROM orderdetails
JOIN products ON products.productCode = orderdetails.productCode
WHERE productLine IN ('Motorcycles', 'Vintage Cars', 'Classic cars')
ORDER BY orderNumber, discount DESC;

