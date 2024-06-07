--requete sur le customer , join a l'employe et son office ,et son CA
SELECT customers.customerNumber, customers.customerName, customers.contactLastName, customers.contactFirstName, customers.addressLine1,customers.addressLine2,customers.city,customers.state,customers.postalCode,customers.country, customers.creditLimit ,
employees.firstName, employees.lastName, employees.email, offices.city, offices.country, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) as ca
FROM customers
INNER JOIN employees ON employees.employeeNumber = customers.salesRepEmployeeNumber
INNER JOIN offices ON employees.officeCode = offices.officeCode
INNER JOIN orders ON orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails ON  orderdetails.orderNumber = orders.orderNumber
WHERE customers.customerNumber = 141
GROUP BY customers.customerNumber;


--Liste des orders faites par ce customers : numero de commande , date , due , expediee , status , nb de piece et total de la commande !
SELECT orderdetails.orderNumber, `orderDate`,`requiredDate`,`shippedDate`,`status`, SUM(orderdetails.quantityOrdered), SUM(orderdetails.priceEach)
FROM orders
INNER JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
WHERE orders.customerNumber = 141
GROUP BY orderdetails.orderNumber
ORDER BY orderdetails.orderNumber DESC;
