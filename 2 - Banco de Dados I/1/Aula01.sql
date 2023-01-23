CREATE TABLE professores(
	professor_id SERIAL NOT NULL,
	nome VARCHAR(40),
	dominio1 VARCHAR(40),
	dominio2 VARCHAR(40),
	dominio3 VARCHAR(40)
	
);

INSERT INTO professores (nome, 
						dominio1, 
						dominio2, 
						dominio3)
			VALUES ('Sandro Saorin',
					'SQL',
					'Machine Learning',
					'Data Science');