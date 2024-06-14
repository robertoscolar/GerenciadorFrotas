USE GerenciadorFrotas
GO

CREATE TABLE tblEstado (
    id      INT IDENTITY,
    uf  VARCHAR(2),

    CONSTRAINT pk_estado PRIMARY KEY(id)
)

CREATE TABLE tblCidade (
    id          INT IDENTITY,
    cidade      VARCHAR(100),
    estadoId   INT,

    CONSTRAINT pk_cidade        PRIMARY KEY(id),
	CONSTRAINT fk_cidadeEstado  FOREIGN KEY(estadoId) REFERENCES tblEstado
)

CREATE TABLE tblUsuario (
    id          INT IDENTITY,
    login       VARCHAR(20),
    nome        VARCHAR(255),
    email       VARCHAR(255),
    senha       VARCHAR(255),
    ativo       BIT,

    CONSTRAINT pk_tarefa            PRIMARY KEY(ID)
)

CREATE TABLE tblVeiculo (
    id	                    INT IDENTITY,
    modelo                  VARCHAR(15),
    marca                   VARCHAR(15),
    placa                   VARCHAR(15),
    chassi                  VARCHAR(15),
    quilometragemInicial    INT,
    quilometragemAtual      INT,
    ativo                   BIT,

    CONSTRAINT pk_veiculo           PRIMARY KEY(id)
)

CREATE TABLE tblEndereco (
    id	            INT IDENTITY,
    logradouro	    VARCHAR(100),
    numero	        INT,
    complemento	    VARCHAR(50),
    bairro	        VARCHAR(50),
    cep	            VARCHAR(9),
    referencia	    VARCHAR(50),
    cidadeId	    INT,
    oficinaId       INT,

    CONSTRAINT pk_endereco          PRIMARY KEY(id),
	CONSTRAINT fk_enderecoCidade    FOREIGN KEY(cidadeId) REFERENCES tblCidade,
    CONSTRAINT fk_enderecoOficina   FOREIGN KEY(oficinaId) REFERENCES tblOficina
)