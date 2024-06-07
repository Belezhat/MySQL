-- Deux requêtes
SELECT productCode, productName, productLine, productScale,productVendor,productDescription, quantityInStock, buyPrice,MSRP 
FROM `products` 
WHERE products.productCode = 'S18_3232';


SELECT orderdetails.orderNumber, orders.orderDate, customers.customerName , orderdetails.quantityOrdered, orderdetails.priceEach , round(sum(orderdetails.quantityOrdered*orderdetails.priceEach),2)
FROM `orderdetails`
INNER JOIN products ON orderdetails.productCode = products.productCode
INNER JOIN orders ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN customers ON customers.customerNumber = orders.customerNumber
WHERE products.productCode = 'S18_3232'
GROUP BY orderdetails.orderNumber
ORDER BY orderdetails.orderNumber DESC;