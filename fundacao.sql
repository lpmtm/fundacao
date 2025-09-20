CREATE SCHEMA IF NOT EXISTS fundacao;

CREATE TABLE fundacao.aluno (		--populada 
    id_aluno INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    email_aluno VARCHAR(100) NOT NULL
);

CREATE TABLE fundacao.professores (		--populada 
    id_professor INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email_professor VARCHAR(100) NOT NULL,
    nome_professor VARCHAR(100) NOT NULL
);

CREATE TABLE fundacao.patrocinador (		--populada 
    id_patrocinador INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_patrocinador VARCHAR(100) NOT NULL
);

CREATE TABLE fundacao.curso (				--populada
    id_curso SERIAL PRIMARY KEY,
    duracao_curso INTERVAL NOT NULL,
	nome_curso VARCHAR(100) NOT NULL,
	nivel_curso VARCHAR(100) NOT NULL,
    id_aluno INT REFERENCES fundacao.aluno(id_aluno),
    id_professor INT REFERENCES fundacao.professores(id_professor)
);

CREATE TABLE fundacao.eventos (			--populada
    id_eventos INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nome_evento VARCHAR(100) NOT NULL,
    data_eventos DATE NOT NULL,
    id_curso INT REFERENCES fundacao.curso(id_curso)
);

CREATE TABLE fundacao.avaliacao (		--populada
    id_avaliacao INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nota_avaliacao INT NOT NULL,
    id_curso INT REFERENCES fundacao.curso(id_curso),
    id_aluno INT REFERENCES fundacao.aluno(id_aluno)
);

CREATE TABLE fundacao.boletim (			--populada
    id_boletim INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    frequencia_boletim INT NOT NULL,
    desempenho_boletim NUMERIC NOT NULL,
    id_curso INT REFERENCES fundacao.curso(id_curso),
    id_avaliacao INT REFERENCES fundacao.avaliacao(id_avaliacao),
    id_aluno INT REFERENCES fundacao.aluno(id_aluno)
);

CREATE TABLE fundacao.certificado (		--populada
    id_certificado INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    data_conclusao DATE NOT NULL,
    id_curso INT REFERENCES fundacao.curso(id_curso),
    id_boletim INT REFERENCES fundacao.boletim(id_boletim),
    id_aluno INT REFERENCES fundacao.aluno(id_aluno)
);

-- Tabela de ligação para o relacionamento "ministra" (cursos-professores)
CREATE TABLE fundacao.ministra_curso (
    id_curso INT REFERENCES fundacao.curso(id_curso),
    id_professor INT REFERENCES fundacao.professores(id_professor),
    PRIMARY KEY (id_curso, id_professor)
);

-- Tabela de ligação para o relacionamento "realiza" (cursos-eventos)
CREATE TABLE fundacao.realiza_evento (
    id_curso INT REFERENCES fundacao.curso(id_curso),
    id_eventos INT REFERENCES fundacao.eventos(id_eventos),
    PRIMARY KEY (id_curso, id_eventos)
);

-- Tabela de ligação para o relacionamento "organiza" (eventos-patrocinador)
CREATE TABLE fundacao.eventos_patrocinador (
    id_eventos INT REFERENCES fundacao.eventos(id_eventos),
    id_patrocinador INT REFERENCES fundacao.patrocinador(id_patrocinador),
    PRIMARY KEY (id_eventos, id_patrocinador)
);

-- Tabela de ligação para o relacionamento "faz" (cursos-aluno)
CREATE TABLE fundacao.aluno_curso (
    id_curso INT REFERENCES fundacao.curso(id_curso),
    id_aluno INT REFERENCES fundacao.aluno(id_aluno),
    PRIMARY KEY (id_curso, id_aluno)
);

-- Tabela de ligação para o relacionamento "tem" (aluno-boletim)
CREATE TABLE fundacao.aluno_boletim (
    id_aluno INT REFERENCES fundacao.aluno(id_aluno),
    id_boletim INT REFERENCES fundacao.boletim(id_boletim),
    PRIMARY KEY (id_aluno, id_boletim)
);

-- Tabela de ligação para o relacionamento "tem" (aluno-certificado)
CREATE TABLE fundacao.aluno_certificado (
    id_aluno INT REFERENCES fundacao.aluno(id_aluno),
    id_certificado INT REFERENCES fundacao.certificado(id_certificado),
    PRIMARY KEY (id_aluno, id_certificado)
);

-- Tabela de ligação para o relacionamento "tem" (aluno-avaliacao)
CREATE TABLE fundacao.aluno_avaliacao (
    id_aluno INT REFERENCES fundacao.aluno(id_aluno),
    id_avaliacao INT REFERENCES fundacao.avaliacao(id_avaliacao),
    PRIMARY KEY (id_aluno, id_avaliacao)
);

-- Populando tabelas
SELECT *FROM fundacao.aluno;
INSERT INTO fundacao.aluno(nome_aluno, email_aluno) VALUES
('Ian Melo', 'ianmelo@gmail.com'),
('Alessandro Ribeiro', 'alessandroribeiro@gmail.com'),
('Amanda Dahm', 'amandadahm@gmail.com'),
('Eduardo Lima', 'eduardolima@gmail.com');

SELECT *FROM fundacao.professores;
INSERT INTO fundacao.professores(nome_professor, email_professor) VALUES
('Ana Souza', 'ana@plataforma.org'),
('João Mendes', 'joao@plataforma.org'),
('Maria Silva', 'maria@plataforma.org'),
('José Maria', 'jose@plataforma.org'),
('Fernanda Santos', 'fernanda@plataforma.org');

SELECT *FROM fundacao.patrocinador;
INSERT INTO fundacao.patrocinador(nome_patrocinador) VALUES
('Google Brasil'),
('BRB'),
('GDF'),
('SEBRAE'),
('Alura');

SELECT *FROM fundacao.curso;
INSERT INTO fundacao.curso(duracao_curso, nome_curso, nivel_curso,)VALUES
('20h', 'Introdução ao Python', 'Iniciante'),
('15h', 'Fundamentos de Banco de Dados', 'Iniciante'),
('25h', 'Redes de Computadores', 'Intermediário'),
('06h', 'Pensamento Computacional', 'Iniciante'),
('10h', 'Python com Estrutura de Dados', 'Avançado');

SELECT *FROM fundacao.eventos
INSERT INTO fundacao.eventos(nome_evento, data_eventos, id_curso)VALUES
('Semana da Tecnologia', '2024-03-02', 1),
('Tech Wave','2023-07-15', 1),
('Fábrica de Ideias', '2023-10-26', 1),
('Mentes em Ação', '2025-01-10', 1),
('InovaLab', '2025-04-09', 1);

SELECT *FROM fundacao.avaliacao
INSERT INTO fundacao.avaliacao(nota_avaliacao, id_curso, id_aluno)VALUES
('8', 1, 1),
('8', 1, 1),
('7', 1, 1),
('7', 1, 1),
('8', 1, 1);

SELECT *FROM fundacao.boletim
INSERT INTO fundacao.boletim(frequencia_boletim, desempenho_boletim)VALUES
('100', '10'),
('100', '10'),
('100', '8'),
('100', '8'),
('100', '9');


SELECT *FROM fundacao.certificado
INSERT INTO fundacao.certificado(data_conclusao)VALUES
('2024-02-01'),
('2024-07-01'),
('2025-10-06'),
('2025-11-09'),
('2024-12-12');

-- Arrumandos as tabelas
DELETE FROM fundacao.avaliacao
WHERE id_curso IS NULL OR id_aluno IS NULL;

DELETE FROM fundacao.eventos
WHERE id_curso IS NULL;



