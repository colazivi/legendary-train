SELECT DATE(A.Timestamp) AS Datum, TIME(A.Timestamp) AS Uhrzeit, Burgenland, Kärnten, Niederösterreich, Oberösterreich, Salzburg, Steiermark, Tirol, Vorarlberg, Wien, (IFNULL(Burgenland,0) + IFNULL(Kärnten,0) + IFNULL(Niederösterreich,0) + IFNULL(Oberösterreich,0) + IFNULL(Salzburg,0) + IFNULL(Steiermark,0) + IFNULL(Tirol,0) + IFNULL(Vorarlberg,0) + IFNULL(Wien,0)) AS Österreich FROM

(SELECT SUM(Anzahl) AS Burgenland, Timestamp FROM Bezirksinfektionen WHERE GKZ BETWEEN 100 AND 199 GROUP BY Timestamp ) A
INNER JOIN
(SELECT SUM(Anzahl) AS Kärnten, Timestamp FROM Bezirksinfektionen WHERE GKZ BETWEEN 200 AND 299 GROUP BY Timestamp) B
ON A.Timestamp=B.Timestamp
INNER JOIN
(SELECT SUM(Anzahl) AS Niederösterreich, Timestamp FROM Bezirksinfektionen WHERE GKZ BETWEEN 300 AND 399 GROUP BY Timestamp) C
ON A.Timestamp=C.Timestamp
INNER JOIN
(SELECT SUM(Anzahl) AS Oberösterreich, Timestamp FROM Bezirksinfektionen WHERE GKZ BETWEEN 400 AND 499 GROUP BY Timestamp) D
ON A.Timestamp=D.Timestamp
INNER JOIN
(SELECT SUM(Anzahl) AS Salzburg, Timestamp FROM Bezirksinfektionen WHERE GKZ BETWEEN 500 AND 599 GROUP BY Timestamp) E
ON A.Timestamp=E.Timestamp
INNER JOIN
(SELECT SUM(Anzahl) AS Steiermark, Timestamp FROM Bezirksinfektionen WHERE GKZ BETWEEN 600 AND 699 GROUP BY Timestamp) F
ON A.Timestamp=F.Timestamp
INNER JOIN
(SELECT SUM(Anzahl) AS Tirol, Timestamp FROM Bezirksinfektionen WHERE GKZ BETWEEN 700 AND 799 GROUP BY Timestamp) G
ON A.Timestamp=G.Timestamp
INNER JOIN
(SELECT SUM(Anzahl) AS Vorarlberg, Timestamp FROM Bezirksinfektionen WHERE GKZ BETWEEN 800 AND 899 GROUP BY Timestamp) H
ON A.Timestamp=H.Timestamp
INNER JOIN
(SELECT SUM(Anzahl) AS Wien, Timestamp FROM Bezirksinfektionen WHERE GKZ BETWEEN 900 AND 999 GROUP BY Timestamp) I
ON A.Timestamp=I.Timestamp

ORDER BY A.Timestamp;
