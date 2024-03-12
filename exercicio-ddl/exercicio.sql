-- 1. criar a tabela Cidade
DROP TABLE Cidade;
CREATE TABLE Cidade(Codigo NUMBER(4) CONSTRAINT cidade_cod_nn NOT NULL CONSTRAINT cidade_cod_pk PRIMARY KEY,
                    Nome VARCHAR(30) CONSTRAINT cidade_nome_nn NOT NULL);
		
    
-- 2. criar a tabela Socio
DROP TABLE Socio;
CREATE TABLE Socio(Cpf CHAR(11) CONSTRAINT socio_cpf_nn NOT NULL CONSTRAINT socio_cpf_pk PRIMARY KEY,
                   Nome VARCHAR(20) CONSTRAINT socio_nome_nn NOT NULL,
                   DataNasc DATE CONSTRAINT socio_data_nn NOT NULL,
                   Rg VARCHAR(15) CONSTRAINT socio_rg_nn NOT NULL,
                   Cidade INT CONSTRAINT socio_cid_nn NOT NULL,
                   CONSTRAINT cidade_socio_fk FOREIGN KEY (Cidade) REFERENCES Cidade(Codigo));

            	            	
-- 3. alterar a tabela Cidade
ALTER TABLE Cidade ADD Uf CHAR(2) CONSTRAINT cidade_uf_nn NOT NULL;

-- 4. alterar a tabela Sócio
ALTER TABLE Socio ADD (Fone VARCHAR(10),
                       Sexo CHAR(1) CONSTRAINT socio_sexo_nn NOT NULL);
								  
-- 5. alterar na tabela Sócio o tipo do campo Nome
ALTER TABLE Socio MODIFY Nome VARCHAR(35);

-- 6. Criar a tabela Setor
DROP TABLE Setor
CREATE TABLE Setor(Codigo NUMBER(3) CONSTRAINT setor_cod_nn NOT NULL CONSTRAINT setor_cod_pk PRIMARY KEY,
                   Nome VARCHAR(30) CONSTRAINT setor_nome_nn NOT NULL);
						 
-- 7. Alterar a tabela Sócio para incluir Setor
ALTER TABLE Socio ADD Setor NUMBER(3) CONSTRAINT socio_setor_nn NOT NULL;
ALTER TABLE Socio ADD CONSTRAINT setor_socio_fk FOREIGN KEY (Setor) REFERENCES Setor(Codigo);
								
-- 8. Criar a tabela Dependente
DROP TABLE Dependente
CREATE TABLE Dependente(Socio CHAR(11) CONSTRAINT dep_socio_nn NOT NULL,
                        CONSTRAINT socio_dep_fk FOREIGN KEY (Socio) REFERENCES Socio(Cpf),
						Numero NUMBER(4) CONSTRAINT dep_num_pk PRIMARY KEY,
						Nome VARCHAR(30) CONSTRAINT dep_nome_nn NOT NULL,
						DataNasc DATE CONSTRAINT dep_data_nn NOT NULL);
     
