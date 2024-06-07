-- Informations de l'employé

-- Sélectionner les informations de l'employé ainsi que le chiffre d'affaires total qu'il a généré
SELECT employees.firstName, employees.lastName, employees.jobTitle, employees.email, offices.city, offices.phone, offices.addressLine1, offices.country, ROUND(SUM(orderdetails.quantityOrdered * orderdetails.priceEach), 2) AS caTotal
FROM employees
-- Jointure avec la table offices pour obtenir les informations sur les bureaux des employés
JOIN offices ON offices.officeCode = employees.officeCode
-- Jointure avec la table customers pour obtenir les informations sur les clients
JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
-- Jointure avec la table orders pour obtenir les informations sur les commandes des clients
JOIN orders ON customers.customerNumber = orders.customerNumber
-- Jointure avec la table orderdetails pour obtenir les détails des commandes
JOIN orderdetails ON  orders.orderNumber = orderdetails.orderNumber
WHERE employees.employeeNumber = 1370
GROUP BY employees.employeeNumber;

-- Commandes de ses clients

-- Sélectionner les informations des commandes des clients de l'employé
SELECT orders.orderNumber, customers.customerName, orders.orderDate, orders.requiredDate, orders.shippedDate, orders.status, 
SUM(orderdetails.quantityOrdered) AS nbPieces,
ROUND(SUM(orderdetails.quantityOrdered * orderdetails.priceEach), 2)
FROM orders
JOIN customers ON orders.customerNumber = customers.customerNumber
JOIN employees ON. customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
WHERE employees.employeeNumber = 1370
GROUP BY orders.orderNumber, customers.customerName, orders.orderDate, orders.requiredDate, orders.shippedDate, orders.status
ORDER BY orders.orderNumber DESC;

