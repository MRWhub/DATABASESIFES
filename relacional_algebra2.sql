---UNIÃO, INTERSECÇÃO, SUBTRAÇÃO E PRODUTO CARTESIANO


--1)
SELECT nome 
FROM EMPREGADO;

SELECT nome_dependente 
FROM DEPENDENTE;

SELECT nome AS Nome 
FROM EMPREGADO
UNION
SELECT nome_dependente AS Nome 
FROM DEPENDENTE
ORDER BY Nome;

--2)
SELECT rg 
FROM EMPREGADO
INTERSECT
SELECT rg_responsavel 
FROM DEPENDENTE;


--3)
SELECT numero 
FROM DEPARTAMENTO
EXCEPT
SELECT numero_depto 
FROM DEPARTAMENTO_PROJETO;


--4)
SELECT EMPREGADO.rg, EMPREGADO.nome AS Nome_Funcionario, PROJETO.nome AS Nome_Projeto
FROM EMPREGADO, PROJETO;

--Número de funcionários × Número de projetos

SELECT COUNT(*) AS Total_Registros
FROM EMPREGADO, PROJETO;



--JUNÇÃO


--1)
SELECT 
    PROJETO.nome AS Nome_Projeto, 
    DEPARTAMENTO_PROJETO.numero_depto, 
    DEPARTAMENTO_PROJETO.numero_projeto
FROM 
    DEPARTAMENTO_PROJETO
INNER JOIN 
    PROJETO
ON 
    DEPARTAMENTO_PROJETO.numero_projeto = PROJETO.numero;

--2)
SELECT 
    EMPREGADO.nome AS Nome_Empregado, 
    PROJETO.nome AS Nome_Projeto
FROM 
    EMPREGADO_PROJETO
INNER JOIN 
    PROJETO
ON 
    EMPREGADO_PROJETO.numero_projeto = PROJETO.numero
INNER JOIN 
    EMPREGADO
ON 
    EMPREGADO_PROJETO.rg_empregado = EMPREGADO.rg;

--3)
SELECT 
    EMPREGADO.nome AS Funcionario, 
    PROJETO.nome AS Projeto, 
    EMPREGADO_PROJETO.horas AS Horas_Trab
FROM 
    EMPREGADO_PROJETO
INNER JOIN 
    PROJETO
ON 
    EMPREGADO_PROJETO.numero_projeto = PROJETO.numero
INNER JOIN 
    EMPREGADO
ON 
    EMPREGADO_PROJETO.rg_empregado = EMPREGADO.rg;

--4)
SELECT 
    DEPENDENTE.codigo AS Codigo_Depend, 
    EMPREGADO.nome AS Nome_Empregado, 
    DEPENDENTE.nome_dependente AS Nome_Depend, 
    DEPENDENTE.relacao AS Relacao
FROM 
    DEPENDENTE
INNER JOIN 
    EMPREGADO
ON 
    DEPENDENTE.rg_responsavel = EMPREGADO.rg
ORDER BY 
    EMPREGADO.nome;

--5)
SELECT 
    EMPREGADO.nome AS Nome_Empregado, 
    HISTORICO_SALARIO.data_ini_sal AS Data_Inicio, 
    HISTORICO_SALARIO.data_fim_sal AS Data_Fim, 
    HISTORICO_SALARIO.salario AS Salario
FROM 
    EMPREGADO
INNER JOIN 
    HISTORICO_SALARIO
ON 
    EMPREGADO.rg = HISTORICO_SALARIO.rg;

--6)
SELECT 
    EMPREGADO.nome AS Funcionario, 
    PROJETO.nome AS Projeto, 
    EMPREGADO_PROJETO.horas AS Horas_Trab
FROM 
    EMPREGADO_PROJETO
INNER JOIN 
    PROJETO
ON 
    EMPREGADO_PROJETO.numero_projeto = PROJETO.numero
INNER JOIN 
    EMPREGADO
ON 
    EMPREGADO_PROJETO.rg_empregado = EMPREGADO.rg
WHERE 
    PROJETO.nome = 'Financeiro';

--7)
SELECT 
    EMPREGADO.nome AS Nome_Empregado, 
    HISTORICO_SALARIO.data_ini_sal AS Data_Inicio, 
    HISTORICO_SALARIO.data_fim_sal AS Data_Fim, 
    HISTORICO_SALARIO.salario AS Salario, 
    DEPARTAMENTO.nome AS Nome_Departamento
FROM 
    EMPREGADO
INNER JOIN 
    HISTORICO_SALARIO
ON 
    EMPREGADO.rg = HISTORICO_SALARIO.rg
LEFT JOIN 
    DEPARTAMENTO
ON 
    EMPREGADO.depto = DEPARTAMENTO.numero;

--8)
SELECT 
    EMPREGADO.nome AS Nome_Empregado, 
    HISTORICO_SALARIO.data_ini_sal AS Data_Inicio, 
    HISTORICO_SALARIO.data_fim_sal AS Data_Fim, 
    HISTORICO_SALARIO.salario AS Salario, 
    DEPARTAMENTO.nome AS Nome_Departamento
FROM 
    EMPREGADO
INNER JOIN 
    HISTORICO_SALARIO
ON 
    EMPREGADO.rg = HISTORICO_SALARIO.rg
LEFT JOIN 
    DEPARTAMENTO
ON 
    EMPREGADO.depto = DEPARTAMENTO.numero
WHERE 
    HISTORICO_SALARIO.salario > 2500
ORDER BY 
    HISTORICO_SALARIO.salario DESC;

--9)
SELECT 
    EMPREGADO.nome AS Nome_Empregado, 
    HISTORICO_SALARIO.data_ini_sal AS Data_Inicio, 
    HISTORICO_SALARIO.data_fim_sal AS Data_Fim, 
    HISTORICO_SALARIO.salario AS Salario, 
    DEPARTAMENTO.nome AS Nome_Departamento, 
    PROJETO.nome AS Nome_Projeto
FROM 
    EMPREGADO
INNER JOIN 
    HISTORICO_SALARIO
ON 
    EMPREGADO.rg = HISTORICO_SALARIO.rg
LEFT JOIN 
    DEPARTAMENTO
ON 
    EMPREGADO.depto = DEPARTAMENTO.numero
LEFT JOIN 
    EMPREGADO_PROJETO
ON 
    EMPREGADO.rg = EMPREGADO_PROJETO.rg_empregado
LEFT JOIN 
    PROJETO
ON 
    EMPREGADO_PROJETO.numero_projeto = PROJETO.numero
WHERE 
    HISTORICO_SALARIO.salario > 2000
ORDER BY 
    HISTORICO_SALARIO.salario DESC;

--10)

SELECT 
    EMPREGADO.nome AS Nome_Empregado, 
    HISTORICO_SALARIO.data_ini_sal AS Data_Inicio, 
    HISTORICO_SALARIO.data_fim_sal AS Data_Fim, 
    HISTORICO_SALARIO.salario AS Salario, 
    DEPARTAMENTO.nome AS Nome_Departamento, 
    PROJETO.nome AS Nome_Projeto, 
    DEPENDENTE.nome_dependente AS Nome_Depend, 
    DEPENDENTE.sexo AS Sexo_Depend
FROM 
    EMPREGADO
INNER JOIN 
    HISTORICO_SALARIO
ON 
    EMPREGADO.rg = HISTORICO_SALARIO.rg
LEFT JOIN 
    DEPARTAMENTO
ON 
    EMPREGADO.depto = DEPARTAMENTO.numero
LEFT JOIN 
    EMPREGADO_PROJETO
ON 
    EMPREGADO.rg = EMPREGADO_PROJETO.rg_empregado
LEFT JOIN 
    PROJETO
ON 
    EMPREGADO_PROJETO.numero_projeto = PROJETO.numero
LEFT JOIN 
    DEPENDENTE
ON 
    EMPREGADO.rg = DEPENDENTE.rg_responsavel
WHERE 
    HISTORICO_SALARIO.salario > 2000 
    AND HISTORICO_SALARIO.salario < 4000
    AND DEPENDENTE.sexo = 'F'
ORDER BY 
    HISTORICO_SALARIO.salario DESC;

