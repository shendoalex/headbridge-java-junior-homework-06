-- Задание: 1
-- Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол.
-- Вывести: model, speed и hd

SELECT model, speed, hd
FROM PC
WHERE price < 500;

--

-- Задание: 2
-- Найдите производителей принтеров.
-- Вывести: maker

SELECT DISTINCT maker
FROM Product
WHERE type = 'Printer';

--

-- Задание: 3
-- Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов,
-- цена которых превышает 1000 дол.

SELECT model, ram, screen
FROM Laptop
WHERE price > 1000;

--

-- Задание: 4
-- Найдите все записи таблицы Printer для цветных принтеров.

SELECT *
FROM Printer
WHERE color = 'y';

--

-- Задание: 5
-- Найдите номер модели, скорость и размер жесткого диска ПК,
-- имеющих 12x или 24x CD и цену менее 600 дол.

SELECT model, speed, hd
FROM PC
WHERE cd IN ('12x', '24x')
  AND price < 600;

--

-- Задание: 6
-- Для каждого производителя, выпускающего ПК-блокноты
-- c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов.
-- Вывод: производитель, скорость.

SELECT DISTINCT maker, speed
FROM Laptop as l,
     Product as p
WHERE l.model = p.model
  AND l.hd >= 10;

SELECT DISTINCT maker, speed
FROM Laptop as l
         LEFT JOIN Product as p
                   ON l.model = p.model
WHERE l.model = p.model
  AND l.hd >= 10

--

-- Задание: 7
-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа)
-- производителя B (латинская буква).

SELECT prod.model, price
FROM Product prod
         LEFT JOIN PC AS pc
                   ON prod.model = pc.model
WHERE prod.model = pc.model
  AND maker = 'B'
UNION
SELECT prod.model, price
FROM Product prod
         LEFT JOIN Laptop AS lp
                   ON prod.model = lp.model
WHERE prod.model = lp.model
  AND maker = 'B'
UNION
SELECT prod.model, price
FROM Product prod
         LEFT JOIN Printer AS pr
                   ON prod.model = pr.model
WHERE prod.model = pr.model
  AND maker = 'B'


--

-- Задание: 8
-- Найдите производителя, выпускающего ПК, но не ПК-блокноты.

SELECT DISTINCT maker
FROM Product
WHERE Product.type = 'PC'
  AND Product.maker
    NOT IN (SELECT Product.maker
            FROM Product
            WHERE Product.type = 'Laptop');

--

-- Задание: 9
-- Найдите производителей ПК с процессором не менее 450 Мгц.
-- Вывести: Maker

SELECT DISTINCT maker
FROM Product,
     PC
WHERE Product.model = PC.model
  AND PC.speed >= 450;

SELECT DISTINCT maker
FROM Product p
         LEFT JOIN PC ON p.model = PC.model
WHERE p.model = pc.model
  AND pc.speed > 449

--

-- Задание: 10
-- Найдите модели принтеров, имеющих самую высокую цену.
-- Вывести: model, price

SELECT model, price
FROM Printer
WHERE price = (SELECT MAX(price) FROM Printer);

SELECT model, price
FROM Printer
GROUP BY model, price
HAVING price = (SELECT MAX(price) FROM printer);