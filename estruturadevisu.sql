-----VISUALIZAR visu

SELECT participantID AS pacid, formrecordID, questionGroupFormRecordID,
questionID, listOfValuesID, answer FROM visu     (WHERE)
-------------------------
--------VIEW P RELACOES
--------------------------
CREATE VIEW visu AS 
SELECT * FROM 
tb_formrecord t1 NATURAL JOIN tb_questiongroupformrecord t2 
NATURAL JOIN tb_participant
NATURAL JOIN tb_assessmentquestionnaire

---------------------------------
--------view MORTOS
--------------------------------------

CREATE VIEW mortos2 AS
 SELECT * FROM visu WHERE questionID = 123 AND listOfValuesID = 275

--------------------------------
----------view VIVOS
---------------------------

CREATE VIEW vivos2 AS
 SELECT * FROM visu WHERE questionID = 123 AND listOfValuesID = 276


-------------------------------------------
---------visualização dos pacientes e sexos
-------------------------------------------


---sexo feminino ao nascer (27 total)


CREATE VIEW sexofem AS
SELECT participantID AS pacfem FROM visu 
WHERE questionID=111 AND listOfValuesID = 284


--------
---sexo masculino ao nascer (48 total)
CREATE VIEW sexomasc AS
SELECT participantID AS pacmasc
 FROM visu WHERE questionID=111 AND listOfValuesID = 285


-----------------------------
----pessoas que usaram lopinavir/ritonavir
--------------------------
-----------------------------
CREATE VIEW pacidlop as
select participantID AS pacidlop from (SELECT * FROM visu
WHERE questionID= 101 AND listOfValuesID = 3
GROUP BY participantID) R


----pessoas que usaram azitromicina
--------------------------
CREATE VIEW pacidazit AS 
select pacid as pacazitrom FROM (SELECT participantID AS pacid, formrecordID, questionGroupFormRecordID,
questionID, listOfValuesID, answer FROM visu
WHERE questionID= 101 AND listOfValuesID = 305
GROUP BY pacid) R

-----------------------------
----pessoas que usaram cloroquina
--------------------------


CREATE VIEW pacidcloro as
select participantID AS pacidcloro from (SELECT * FROM visu
WHERE questionID= 101 AND listOfValuesID = 306
GROUP BY participantID) R

--------------------------------
-----LEITOS UTI view
-----------------------------------

create view leitos as SELECT * FROM visu WHERE questionID = 228

-----------------------------
-----IDADES VIEW
-------------------------------

CREATE VIEW idades AS SELECT * FROM visu WHERE questionID = 144


----------------------------------
----------JOVENS VIEW
----------------------------------

CREATE VIEW jovens AS
SELECT * FROM idades WHERE answer BETWEEN 0 AND 19

----------------------------------
----------ADULTOS VIEW
----------------------------------

CREATE VIEW ADULTOS AS
SELECT * FROM idades WHERE answer BETWEEN 19 AND 59

----------------------------------
----------IDOSOS VIEW
----------------------------------

CREATE VIEW IDOSOS AS
SELECT * FROM idades WHERE answer > 59


-------------------------------
-----QUANTIDADE DE UTI
-------------------------------

SELECT COUNT(participantID)
 FROM visu WHERE questionID = 150 AND listOfValuesID = 298


----------------------------------------------------
--------MÉDIA DE IDADE DE QUEM PRECISOU DE LEITO 

SELECT AVG(answer) FROM (SELECT participantID AS pacid FROM leitos) AS L INNER JOIN (SELECT * FROM idades) AS I
ON L.pacid=I.participantID

-------------------------------
---CONTAGEM DE ANTIVIRAIS (possivelmente duplicado)
---------------
SELECT listOfValuesID AS antiviral,count( listOfValuesID ) AS contagem
 FROM visu WHERE questionID= 101
 GROUP BY listOfValuesID
 
-------------------------------------------
------------VIEW PARA PACIENTES QUE TOMARAM 
------------E QUAIS ANTIVIRAIS TOMARAM
--------------------------------
CREATE VIEW pacantiviral AS
SELECT *
 FROM visu WHERE questionID= 101 AND crfFormsID=3
-----------------------------------

----------------------------------
----------QUANTIDADE DE PACINTES QUE TOMARAM ANTIVIRAL--- 67
-------------------------
SELECT COUNT(participantID) FROM (SELECT * FROM visu WHERE questionID=35
GROUP BY participantID) AS PV
---------
SELECT COUNT(participantID) FROM (SELECT *
 FROM visu WHERE questionID= 101
 GROUP BY participantID) AS pvv
 ---------------------------------------



 ---------------------------------
 --------seleciono pacientes e suas datas de inscriçao
 ----------------------------
 SELECT participantID as pacid, answer AS datainsc
  FROM visu WHERE questionID=167

  -------------------
  --------selecao de pacientes e data de desfecho
  ------------------------------------
  SELECT participantID AS pacide, answer AS datadesf
   FROM visu WHERE questionID=124

----------------------------
-------DIFERENCA DE DIAS ENTRE INSCRIÇAO E DESFECHO
-------------------------
SELECT pacid, DATEDIFF(datadesf,datauti) AS durac, datainsc,datadesf
 FROM ( SELECT participantID as pacid, answer AS datainsc
  FROM visu WHERE questionID=167) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide

--------------------------------------
--------------diferenca entre entrada na uti e desfecho
--------------------------------

SELECT pacid, DATEDIFF(datadesf,datauti) AS durac, datauti,datadesf
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide


--------------------------
--quantidade hydroxicloriquina
-------36 pessoas tratadas com

SELECT COUNT(pacid) AS pachyd FROM (SELECT participantID AS pacid, formrecordID, questionGroupFormRecordID,
questionID, listOfValuesID, answer FROM visu
WHERE questionID= 101 AND listOfValuesID = 306
GROUP BY pacid) AS quantidHyd


------MORTOS QUE USARAM HYDROXI

select COUNT(participantID) from (SELECT participantID AS pacid, formrecordID, questionGroupFormRecordID,
questionID, listOfValuesID, answer FROM visu
WHERE questionID= 101 AND listOfValuesID = 306
GROUP BY pacid) C INNER JOIN mortos2 AS M ON
C.pacid= M.participantID


-------VIVOS QUE USARAM HYD

select count(participantID) from (SELECT participantID AS pacid, formrecordID, questionGroupFormRecordID,
questionID, listOfValuesID, answer FROM visu
WHERE questionID= 101 AND listOfValuesID = 306
GROUP BY pacid) C INNER JOIN vivos2 AS V ON
C.pacid= V.participantID

