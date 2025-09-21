-- Adcionando linhas em todas as tabelas
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
INSERT INTO fundacao.curso(duracao_curso, nome_curso, nivel_curso)VALUES
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


-- Atualizando a tabela fundacao.curso e fundacao.eventos
SELECT *FROM fundacao.curso
UPDATE fundacao.curso
SET nivel_curso = 'Intermediário'
WHERE nome_curso = 'Python com Estrutura de Dados';

SELECT *FROM fundacao.eventos
UPDATE fundacao.eventos
SET nome_evento = 'Semana Dev'
WHERE nome_evento = 'InovaLab';


-- exclusao de linhas que estão vazias em: fundacao.avaliacao e em fundacao.eventos
DELETE FROM fundacao.avaliacao
WHERE id_curso IS NULL OR id_aluno IS NULL;

DELETE FROM fundacao.eventos
WHERE id_curso IS NULL;


-- Esta consulta mostra o nome do aluno e o nome do curso que ele está fazendo.
SELECT
    A.nome_aluno,
    C.nome_curso
FROM fundacao.aluno AS A
JOIN fundacao.aluno_curso AS AC
    ON A.id_aluno = AC.id_aluno
JOIN fundacao.curso AS C
    ON AC.id_curso = C.id_curso;

-- Esta consulta lista o nome do aluno, o curso que ele fez e a nota da sua avaliação.
SELECT
    A.nome_aluno,
    C.nome_curso,
    AV.nota_avaliacao
FROM fundacao.aluno AS A
JOIN fundacao.aluno_curso AS AC
    ON A.id_aluno = AC.id_aluno
JOIN fundacao.curso AS C
    ON AC.id_curso = C.id_curso
JOIN fundacao.avaliacao AS AV
    ON C.id_curso = AV.id_curso AND A.id_aluno = AV.id_aluno;
