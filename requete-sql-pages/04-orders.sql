-- Deux requêtes
SELECT orders.orderNumber, orders.status, orders.orderDate, orders.comments,
customers.customerName,customers.contactLastName, customers.contactFirstName, customers.phone,
customers.addressLine1, customers.addressLine2, customers.city, customers.state, customers.postalCode, customers.country
FROM `orders` 
INNER JOIN customers ON customers.customerNumber = orders.customerNumber
WHERE orders.orderNumber = 10425;


SELECT orderdetails.productCode, orderdetails.quantityOrdered, products.productName, products.productLine, products.productScale, orderdetails.priceEach, ROUND(SUM(orderdetails.priceEach*orderdetails.quantityOrdered),2) as total
FROM orders
INNER JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
INNER JOIN products ON products.productCode = orderdetails.productCode
WHERE orders.orderNumber = 10425
GROUP BY productCode;

