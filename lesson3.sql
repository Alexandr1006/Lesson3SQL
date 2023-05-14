//

skypro=# CREATE TABLE city (
    skypro(# city_id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# city_name VARCHAR(60)
        skypro(# );
CREATE TABLE
    skypro=# SELECT * FROM city
    skypro-# ;
city_id | city_name
---------+-----------
(0 строк)

//

skypro=# ALTER TABLE employee ADD city_id BIGSERIAL NOT NULL;
ALTER TABLE
skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  3 | Konstantin | Ivanov    | man    |  20 |       1
  5 | Sergey     | Orlov     | man    |  40 |       2
  6 | Elena      | Ivanova   | woman  |  60 |       3
  4 | Konstantin | Petrov    | man    |  19 |       4
  2 | Sergey     | Popov     | man    |  28 |       5
(5 строк)

//

skypro=# ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES city(city_id);
ALTER TABLE

//

skypro=# INSERT INTO city (
skypro(# city_name)
skypro-# VALUES ('Ekaterinburg'),('Moskva'),('Irkutsk'),('Vladivostok'),('Omsk');
INSERT 0 5
skypro=# SELECT * FROM city;
    city_id |  city_name
---------+--------------
    1 | Ekaterinburg
    2 | Moskva
    3 | Irkutsk
    4 | Vladivostok
    5 | Omsk
    (5 строк)

//

    skypro=# SELECT first_name, last_name, city_name
    skypro-# FROM city
    skypro-# INNER JOIN employee
    skypro-# ON city.city_id=employee.city_id;
    first_name | last_name |  city_name
------------+-----------+--------------
    Konstantin | Ivanov    | Ekaterinburg
    Sergey     | Orlov     | Moskva
    Elena      | Ivanova   | Irkutsk
    Konstantin | Petrov    | Vladivostok
    Sergey     | Popov     | Omsk
    (5 строк)

//

    skypro=# SELECT first_name, last_name, city_name
    skypro-# FROM city
    skypro-# LEFT JOIN employee
    skypro-# ON city.city_id=employee.city_id;
    first_name | last_name |  city_name
------------+-----------+--------------
    Konstantin | Ivanov    | Ekaterinburg
    Sergey     | Orlov     | Moskva
    Elena      | Ivanova   | Irkutsk
    Konstantin | Petrov    | Vladivostok
    Sergey     | Popov     | Omsk
    |           | Kurgan
    (6 строк)

//

    skypro=# SELECT first_name, last_name, city_name
    skypro-# FROM city
    skypro-# CROSS JOIN employee;
    first_name | last_name |  city_name
------------+-----------+--------------
    Konstantin | Ivanov    | Ekaterinburg
    Sergey     | Orlov     | Ekaterinburg
    Elena      | Ivanova   | Ekaterinburg
    Konstantin | Petrov    | Ekaterinburg
    Sergey     | Popov     | Ekaterinburg
    Konstantin | Ivanov    | Moskva
    Sergey     | Orlov     | Moskva
    Elena      | Ivanova   | Moskva
    Konstantin | Petrov    | Moskva
    Sergey     | Popov     | Moskva
    Konstantin | Ivanov    | Irkutsk
    Sergey     | Orlov     | Irkutsk
    Elena      | Ivanova   | Irkutsk
    Konstantin | Petrov    | Irkutsk
    Sergey     | Popov     | Irkutsk
    Konstantin | Ivanov    | Vladivostok
    Sergey     | Orlov     | Vladivostok
    Elena      | Ivanova   | Vladivostok
    Konstantin | Petrov    | Vladivostok
    Sergey     | Popov     | Vladivostok
    Konstantin | Ivanov    | Omsk
    Sergey     | Orlov     | Omsk
    Elena      | Ivanova   | Omsk
    Konstantin | Petrov    | Omsk
    Sergey     | Popov     | Omsk
    Konstantin | Ivanov    | Kurgan
    Sergey     | Orlov     | Kurgan
    Elena      | Ivanova   | Kurgan
    Konstantin | Petrov    | Kurgan
    Sergey     | Popov     | Kurgan
    (30 строк)

