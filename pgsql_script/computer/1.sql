SELECT DISTINCT k.model
FROM (SELECT p.maker, l.hd, l.screen FROM product p
      JOIN laptop l ON l.model = p.model) d,
     (SELECT p.maker, pc.speed, pc.price FROM product p
      JOIN pc ON pc.model = p.model) m,
     (SELECT color, type, price FROM printer) t,
     (SELECT model, color, type, price FROM printer) v,
     (SELECT model, ram, screen FROM laptop) o,
     (SELECT model, speed, ram, hd, price FROM pc) k
WHERE d.maker = m.maker
    AND t.type <> v.type AND t.color = v.color
    AND d.screen = o.screen + 3
    AND m.price = 4 * t.price
    AND stuff(v.model, 3, 1, '') = stuff(o.model, 3, 1, '')
    AND k.speed = m.speed AND k.hd = d.hd AND k.ram = o.ram AND k.price = v.price
