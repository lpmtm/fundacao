--Consultas
--Inserções nas tabelas 
SELECT *FROM fundacao.aluno
INSERT INTO fundacao.aluno(id_aluno, nome_aluno, email_aluno)VALUES
('30120', 'Alessandro Ribeiro', 'alessandroribeiro@gmail.com'),
('30022', 'Amanda Dahm', 'amandadahm@gmail.com'),
('30073', 'Caroline Lopes', 'carolinelopes@gmail.com'),
('30074', 'Eduardo Lima', 'eduardolima@gmail.com'),
('30071', 'Ian Melo', 'ianmelo@gmail.com');

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
('205', 'Alura'),
('206', 'IESB');

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
INSERT INTO fundacao.avaliacao(id_avaliacao, nota_avaliacao, id_curso, id_aluno)VALUES
('901', '8', '001', '30120'),
('902', '8', '002', '30022'),
('903', '7', '003', '30071'),
('904', '7', '004', '30074'),
('905', '8', '005', '30073');

SELECT *FROM fundacao.boletim
INSERT INTO fundacao.boletim(id_boletim, frequencia_boletim, desempenho_boletim, id_curso, id_avaliacao, id_aluno)VALUES
('801', '100', '10', '001', '901', '30120'),
('802', '100', '10', '002', '902', '30022'),
('803', '100', '8', '003', '903', '30071'),
('804', '100', '8', '004', '904', '30074'),
('805', '100', '9', '005', '905', '30073');

SELECT *FROM fundacao.certificado
INSERT INTO fundacao.certificado(id_certificado, data_conclusao, id_curso, id_boletim, id_aluno)VALUES
('401', '2024-02-01', '001', '801', '30120'),
('402', '2024-07-01', '002', '802', '30022'),
('403', '2025-10-06', '003', '803', '30071'),
('404', '2025-11-09', '004', '804', '30074'),
('405', '2024-12-12', '005', '805', '30073');

--Inserções nas tabelas de ligação
SELECT *FROM fundacao.ministra_curso 
INSERT INTO fundacao.ministra_curso(id_curso, id_professor)VALUES
('003', '101'),
('001', '102'),
('005', '103'),
('004', '104'),
('002', '105');

SELECT *FROM fundacao.eventos_patrocinador
INSERT INTO fundacao.eventos_patrocinador(id_eventos, id_patrocinador)VALUES
('701', '204'),
('702', '201'),
('703', '203'),
('704', '205'),
('705', '202');

SELECT *FROM fundacao.aluno_curso
INSERT INTO fundacao.aluno_curso(id_curso, id_aluno)VALUES
('001', '30120'),
('002', '30022'),
('003', '30071'),
('004', '30074'),
('005', '30073');

-- Atualizando a tabela fundacao.eventos
SELECT *FROM fundacao.eventos

UPDATE fundacao.eventos
SET id_curso = '001'
WHERE id_eventos = '701';

UPDATE fundacao.eventos
SET id_curso = '002'
WHERE id_eventos = '702';

UPDATE fundacao.eventos
SET id_curso = '003'
WHERE id_eventos = '703';

UPDATE fundacao.eventos
SET id_curso = '004'
WHERE id_eventos = '704';

UPDATE fundacao.eventos
SET id_curso = '005'
WHERE id_eventos = '705';

-- exclusao de linhas
DELETE FROM fundacao.patrocinador
WHERE id_patrocinador = '206';

-- Consulta em duas tabelas: Essa consulta mostra o nome do aluno e o nome do curso que ele está fazendo.
SELECT
    A.nome_aluno,
    C.nome_curso
FROM fundacao.aluno AS A
JOIN fundacao.aluno_curso AS AC
    ON A.id_aluno = AC.id_aluno
JOIN fundacao.curso AS C
    ON AC.id_curso = C.id_curso;

-- Consulta em três tabelas: Essa consulta lista o nome do aluno, o curso que ele fez e a nota da sua avaliação.
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

