--1)
SELECT nome, localizacao FROM PROJETO 
WHERE 
    localizacao = 'Vitória';


--2)
SELECT nome, localizacao, numero FROM PROJETO 
WHERE
    numero BETWEEN 5 AND 25;


--3)
SELECT * FROM EMPREGADO 
WHERE
    rg_supervisor = 2020 AND salario > 2800;


--4)
SELECT numero, nome AS Nome_Projeto FROM PROJETO 
WHERE
    numero > 5 AND numero < 20;


--5)
SELECT numero, nome AS "Nome do Projeto" FROM PROJETO 
WHERE
    numero >= 5 AND numero <= 20;


--6)
SELECT CONCAT(nome, ' - ', localizacao) AS "Nome e localidade do Projeto" 
FROM PROJETO;


--7)
SELECT nome, salario, salario * 1.10 AS salario_com_acrescimo 
FROM EMPREGADO;

--8)
SELECT nome, salario, salario + 500 AS salario_com_gratificacao 
FROM EMPREGADO;

--9)
SELECT nome, salario, (salario / 12) AS decimo_terceiro_mensal, (salario / 12) / 2 AS parcela_decimo_terceiro 
FROM EMPREGADO;


--10)
SELECT nome, salario, salario - 1000 AS salario_reduzido 
FROM EMPREGADO;


--11)
SELECT nome, salario, 
       salario - ((POW(salario, 2) + (5 * salario) - 100) / 100) AS salario_reduzido 
FROM EMPREGADO;

--12)
SELECT * FROM DEPARTAMENTO 
WHERE 
    rg_gerente IS NULL OR nome = 'Contabilidade';

--13)
SELECT * FROM DEPARTAMENTO 
WHERE
    numero > 1 AND rg_gerente IS NOT NULL;

--14)
SELECT * FROM DEPENDENTE 
WHERE
    rg_responsavel <> 1010 AND sexo = 'Feminino';

--15)
SELECT * FROM DEPENDENTE 
WHERE 
    rg_responsavel = 2020 OR rg_responsavel = 8080;


--16)
SELECT * FROM DEPENDENTE 
WHERE 
    rg_responsavel = 1010 AND nome_dependente = 'Jorge';

--17)
SELECT * FROM DEPENDENTE 
WHERE 
    nascimento > '1986-01-01' AND sexo = 'Feminino';

--18)
SELECT nome, dat_ini_sal, 
       DATEDIFF(CURDATE(), dat_ini_sal) AS dias_sem_aumento 
FROM EMPREGADO;


--PARTE 2

--1)
SELECT * FROM DEPENDENTE 
WHERE
    nome_dependente LIKE 'A%';


--2)
SELECT * FROM DEPENDENTE 
WHERE
    nome_dependente LIKE '_A%';


--3)

SELECT * FROM DEPENDENTE 
WHERE
    nome_dependente LIKE '%E';

--4)
SELECT * FROM DEPENDENTE 
WHERE
    nome_dependente LIKE '%N%';


--5)
SELECT * FROM DEPENDENTE 
WHERE 
    nome_dependente LIKE '%an%';


--6)

SELECT * FROM EMPREGADO 
WHERE 
    nome LIKE '%luiz%';

--7)
SELECT * FROM EMPREGADO 
WHERE 
    nome LIKE '%luiz%' 
AND  
    salario > 2500;

--8)
SELECT * FROM EMPREGADO 
WHERE 
    nome LIKE '%luiz%' 
AND
    salario > 2500 
AND
    rg_supervisor IS NOT NULL;

--9)
SELECT * 
FROM EMPREGADO 
WHERE LENGTH(nome) = 5;

INSERT INTO EMPREGADO (rg, nome, cpf, salario, dat_ini_sal, depto) 
VALUES (9999, 'Lucas', 12345678901, 3000, '2024-01-01', 1);

SELECT * 
FROM EMPREGADO 
WHERE LENGTH(nome) = 5;

--10)
SELECT * 
FROM EMPREGADO 
WHERE LENGTH(nome) > 6 AND nome LIKE 'j%' COLLATE utf8_general_ci;

--11)
SELECT * 
FROM PROJETO 
WHERE LENGTH(nome) = 5 OR nome LIKE 'P%';

--12)
SELECT * 
FROM PROJETO 
WHERE LENGTH(nome) = 5 OR nome LIKE '%c%';

--13)
SELECT * 
FROM PROJETO 
WHERE LENGTH(nome) = 5 AND nome LIKE '%a%' AND localizacao NOT LIKE '%São%';


--ORDER BY 

--1)
SELECT codigo, nome_dependente, relacao 
FROM DEPENDENTE 
ORDER BY nome_dependente;

--2)
SELECT * 
FROM PROJETO 
ORDER BY localizacao;

--3)
SELECT * 
FROM PROJETO 
ORDER BY nome, localizacao;

--4)
SELECT * 
FROM DEPENDENTE 
ORDER BY rg_responsavel DESC, nome_dependente DESC;

--5)
SELECT rg, nome, salario, depto 
FROM EMPREGADO 
WHERE salario > 2500 
ORDER BY salario DESC;
