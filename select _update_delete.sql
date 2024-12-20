--DATA QUERY LANGUAGE 


-----01 a 25-----
--1)

SELECT * FROM PROJETO;

--2)

SELECT nome,localizacao,numero FROM PROJETO;

--3)

SELECT * FROM PROJETO 
WHERE 
    localizacao = 'Vitória';

--4)

SELECT nome, numero FROM PROJETO
WHERE 
    localizacao = 'Vitória';

--5)
SELECT * FROM PROJETO
WHERE 
    numero>10;
--6)
SELECT * FROM  EMPREGADO
WHERE
    salario>3000;
--7) 
SELECT *FROM    EMPREGADO
WHERE 
    rg_supervisor = 1010;
--8)
SELECT * FROM  EMPREGADO
WHERE  
    rg = 4040;
--9)
SELECT * FROM HISTORICO_SALARIO
WHERE
    rg = 4040;
--10)
SELECT * FROM EMPREGADO
WHERE 
    rg_supervisor < 2020;
--11)
SELECT * FROM EMPREGADO
WHERE 
    numero >= 10;
--12) 
SELECT rg,nome FROM EMPREGADO
WHERE
    rg_supervisor <= 2020;
--13)
SELECT * FROM EMPREGADO
WHERE  
     rg_supervisor IS NULL;
--14)
SELECT * FROM  EMPREGADO
WHERE 
    rg_supervisor IS NOT NULL;
--15)
SELECT * FROM EMPREGADO 
WHERE
    depto != 2;
--16)
SELECT nome,cpf FROM EMPREGADO
WHERE
    depto == 2;
--17)
SELECT rg,nome FROM EMPREGADO
WHERE
    depto == 1;
--18)
SELECT nome FROM EMPREGADO
WHERE
    salario>5500;
--19)
SELECT  nome,salario FROM EMPREGADO
WHERE
    salario>=3500;
--20)
SELECT * FROM EMPREGADO
WHERE
    dat_ini_sal > '01-02-2012';
--21)
SELECT nome FROM EMPREGADO
WHERE
    data_ini_sal >='01-05-2012';
--22)
SELECT cpf FROM EMPREGADO
WHERE
    data_ini_sal >= '01-05-2012';
--23)
SELECT * FROM DEPENDENTE 
WHERE
    nascimento > '01-06-1990';
--24)
SELECT nome,sexo FROM DEPENDENTE
WHERE
    relacao = 'Filho';

--DATA MANIPULATION LANGUAGE

--1)
CREATE TABLE DEPARTAMENTO_PROJETO2 
AS SELECT * FROM DEPARTAMENTO_PROJETO;

CREATE TABLE PROJETO2 
AS SELECT * FROM PROJETO;

CREATE TABLE EMPREGADO2 
AS SELECT * FROM  EMPREGADO;

CREATE TABLE DEPARTAMENTO2 
AS SELECT * FROM DEPARTAMENTO;

--2)
---PROJETO2
----a)
INSERT INTO PROJETO2 (numero,nome,localizacao)
VALUES (50,'Ginásio de Esportes','Serra');
----b)
INSERT INTO PROJETO2 (numero,nome,localizacao)
VALUES (51,'Teatro','Vitória');
----c)
UPDATE PROJETO2 SET nome = 'Aguas Claras' 
WHERE 
    numero= 25 --(SELECT numero FROM PROJETO WHERE nome='Aguas Limpas');
----d)
UPDATE PROJETO2 SET nome = 'Águas Limpas' 
WHERE 
    numero= 25 
----e)
UPDATE PROJETO2 SET localizacao = 'Serra'
WHERE
    nome = 'motor';
----f)
DELETE FROM PROJETO2
WHERE
    nome='Ginásio de Esportes';
---DEPARTAMENTO_PROJETO2
----a)
DELETE FROM DEPARTAMENTO_PROJETO2;
----b)
INSERT INTO DEPARTAMENTO_PROJETO2 (codigo,numero_depto,numero_projeto)
SELECT codigo,numero_depto,numero
FROM DEPARTAMENTO_PROJETO;

-----ALL
DELETE FROM DEPARTAMENTO2;
DELETE FROM DEPARTAMENTO_PROJETO2;
DELETE FROM PROJETO2;
DELETE FROM EMPREGADO2;