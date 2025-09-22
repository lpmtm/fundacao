-- Adcionando linhas em todas as tabelas
SELECT *FROM fundacao.aluno
INSERT INTO fundacao.aluno(id_aluno, nome_aluno, email_aluno)VALUES
('30073', 'Caroline Lopes', 'carolinelopes@gmail.com'),
('30071', 'Ian Melo', 'ianmelo@gmail.com'),
('30120', 'Alessandro Ribeiro', 'alessandroribeiro@gmail.com'),
('30022', 'Amanda Dahm', 'amandadahm@gmail.com'),
('30074', 'Eduardo Lima', 'eduardolima@gmail.com');

SELECT *FROM fundacao.professores
INSERT INTO fundacao.professores(id_professor, nome_professor, email_professor) VALUES
('101', 'Ana Souza', 'ana@plataforma.org'),
('102', 'João Mendes', 'joao@plataforma.org'),
('103', 'Maria Silva', 'maria@plataforma.org'),
('104', 'José Maria', 'jose@plataforma.org'),
('105', 'Fernanda Santos', 'fernanda@plataforma.org');

SELECT *FROM fundacao.patrocinador;
INSERT INTO fundacao.patrocinador(id_patrocinador, nome_patrocinador) VALUES
('201', 'Google Brasil'),
('202', 'BRB'),
('203', 'GDF'),
('204', 'SEBRAE'),
('205', 'Alura');

SELECT *FROM fundacao.curso;
INSERT INTO fundacao.curso(id_curso, duracao_curso, nome_curso, nivel_curso)VALUES
('001', '20h', 'Introdução ao Python', 'Iniciante'),
('002', '15h', 'Fundamentos de Banco de Dados', 'Iniciante'),
('003', '25h', 'Redes de Computadores', 'Intermediário'),
('004', '06h', 'Pensamento Computacional', 'Iniciante'),
('005', '10h', 'Python com Estrutura de Dados', 'Avançado');

SELECT *FROM fundacao.eventos
INSERT INTO fundacao.eventos(id_eventos, nome_evento, data_eventos)VALUES
('701', 'Semana da Tecnologia', '2024-03-02'),
('702', 'Tech Wave','2023-07-15'),
('703', 'Fábrica de Ideias', '2023-10-26'),
('704', 'Mentes em Ação', '2025-01-10'),
('705', 'InovaLab', '2025-04-09');

SELECT *FROM fundacao.avaliacao
INSERT INTO fundacao.avaliacao(id_avaliacao, nota_avaliacao)VALUES
('901', '8'),
('902', '8'),
('903', '7'),
('904', '7'),
('905', '8');

SELECT *FROM fundacao.boletim
INSERT INTO fundacao.boletim(id_boletim, frequencia_boletim, desempenho_boletim)VALUES
('801', '100', '10'),
('802', '100', '10'),
('803', '100', '8'),
('804', '100', '8'),
('805', '100', '9');

SELECT *FROM fundacao.certificado
INSERT INTO fundacao.certificado(id_certificado, data_conclusao)VALUES
('401', '2024-02-01'),
('402', '2024-07-01'),
('403', '2025-10-06'),
('404', '2025-11-09'),
('405', '2024-12-12');


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
