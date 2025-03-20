/*1*/
SELECT * FROM dishes d
WHERE d.price <= 20;

/*2*/
SELECT *
FROM dishes d
JOIN restaurants r ON d.id = r.id
WHERE r.cuisine_type IN ('Française', 'Italienne');

/*3*/
SELECT * FROM ingredients i
JOIN dishes d ON i.dish_id = d.id
WHERE i.dish_id =1;

/*4*/
SELECT c.`name`, r.`name` FROM chefs c
JOIN restaurants r ON c.restaurant_id = r.id;

/*5*/
SELECT c.`name`, d.`name` FROM chefs c
JOIN dishes d ON c.restaurant_id = d.chef_id;

/*6*/
SELECT c.`name`,COUNT(d.id) FROM chefs c
JOIN dishes d ON c.id = d.chef_id
GROUP BY c.`name`;

/*7*/
SELECT c.`name`, COUNT(d.id)
FROM chefs c
JOIN dishes d ON c.id = d.chef_id
GROUP BY c.`name`
HAVING COUNT(d.id) = 1;

/*8*/
SELECT r.cuisine_type, COUNT(d.`name`) FROM dishes d
JOIN restaurants r ON d.chef_id = r.id
GROUP BY r.cuisine_type;

/*9*/
SELECT r.cuisine_type, AVG(d.price) FROM dishes d
JOIN restaurants r ON d.chef_id = r.id
GROUP BY r.cuisine_type;

/*10*/
SELECT c.`name`, AVG(d.price)
FROM dishes d
JOIN chefs c ON d.chef_id = c.id
WHERE c.`name` IN (
    SELECT c.`name`
    FROM dishes
    GROUP BY c.`name`
    HAVING COUNT(*) > 2
)
GROUP BY c.`name`;