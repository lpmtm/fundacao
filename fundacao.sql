CREATE SCHEMA IF NOT EXISTS fundacao;

CREATE TABLE fundacao.aluno (
    id_aluno INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    email_aluno VARCHAR(100) NOT NULL
);

CREATE TABLE fundacao.professores (
    id_professor INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email_professor VARCHAR(100) NOT NULL,
    nome_professor VARCHAR(100) NOT NULL
);

CREATE TABLE fundacao.patrocinador (
    id_patrocinador INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_patrocinador VARCHAR(100) NOT NULL
);

CREATE TABLE fundacao.curso (
    id_curso SERIAL PRIMARY KEY,
    duracao_curso INTERVAL NOT NULL,
    id_aluno INT REFERENCES fundacao.aluno(id_aluno),
    id_professor INT REFERENCES fundacao.professores(id_professor)
);

CREATE TABLE fundacao.eventos (
    id_eventos INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    data_eventos DATE NOT NULL,
    id_curso INT REFERENCES fundacao.curso(id_curso)
);

CREATE TABLE fundacao.avaliacao (
    id_avaliacao INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nota_avaliacao INT NOT NULL,
    id_curso INT REFERENCES fundacao.curso(id_curso),
    id_aluno INT REFERENCES fundacao.aluno(id_aluno)
);

-- Boletim
CREATE TABLE fundacao.boletim (
    id_boletim INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    frequencia_boletim INT NOT NULL,
    desempenho_boletim NUMERIC NOT NULL,
    id_curso INT REFERENCES fundacao.curso(id_curso),
    id_avaliacao INT REFERENCES fundacao.avaliacao(id_avaliacao),
    id_aluno INT REFERENCES fundacao.aluno(id_aluno)
);

CREATE TABLE fundacao.certificado (
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
