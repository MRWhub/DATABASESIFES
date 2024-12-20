
CREATE TABLE PROJETO (
    numero INTEGER PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    localizacao VARCHAR(50)
);



CREATE TABLE EMPREGADO (
    rg INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf BIGINT NOT NULL UNIQUE,
    salario FLOAT,
    dat_ini_sal DATE NOT NULL,
    rg_supervisor INTEGER,
    depto INTEGER,
    CONSTRAINT fk_rg_supervisor FOREIGN KEY (rg_supervisor) REFERENCES EMPREGADO(rg)
);

CREATE TABLE DEPARTAMENTO (
    numero INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    rg_gerente INTEGER
);

ALTER TABLE EMPREGADO
ADD CONSTRAINT fk_depto FOREIGN KEY (depto) REFERENCES DEPARTAMENTO(numero);


ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT fk_rg_gerente FOREIGN KEY (rg_gerente) REFERENCES EMPREGADO(rg);

CREATE TABLE DEPENDENTE (
    codigo SERIAL PRIMARY KEY,
    rg_responsavel INTEGER,
    nome_dependente VARCHAR(100) NOT NULL,
    nascimento DATE NOT NULL,
    relacao VARCHAR(20),
    sexo VARCHAR(15),
    CONSTRAINT fk_rg_responsavel FOREIGN KEY (rg_responsavel) REFERENCES EMPREGADO(rg)
);

CREATE TABLE EMPREGADO_PROJETO (
    codigo SERIAL PRIMARY KEY,
    rg_empregado INTEGER,
    numero_projeto INTEGER,
    horas INTEGER NOT NULL,
    CONSTRAINT fk_rg_empregado FOREIGN KEY (rg_empregado) REFERENCES EMPREGADO(rg),
    CONSTRAINT fk_numero_projeto FOREIGN KEY (numero_projeto) REFERENCES PROJETO(numero)
);


CREATE TABLE DEPARTAMENTO_PROJETO (
    codigo SERIAL PRIMARY KEY,
    numero_depto INTEGER,
    numero_projeto INTEGER,
    CONSTRAINT fk_numero_depto FOREIGN KEY (numero_depto) REFERENCES DEPARTAMENTO(numero),
    CONSTRAINT fk_numero_projeto FOREIGN KEY (numero_projeto) REFERENCES PROJETO(numero)
);


CREATE TABLE HISTORICO_SALARIO (
    rg INTEGER,
    data_ini_sal DATE NOT NULL,
    data_fim_sal DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (rg, data_ini_sal),
    CONSTRAINT fk_rg FOREIGN KEY (rg) REFERENCES EMPREGADO(rg)
);
