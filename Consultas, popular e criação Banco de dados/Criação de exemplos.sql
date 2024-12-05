-- Inserir dados de exemplo na tabela de Gêneros Musicais
INSERT INTO GenerosMusicais (nome, descricao) VALUES
('Rock', 'Gênero musical de rock'),
('Pop', 'Gênero musical de pop'),
('Jazz', 'Gênero musical de jazz');

-- Inserir dados de exemplo na tabela de Artistas
INSERT INTO Artistas (nome_artistico, biografia, pais_origem, imagem_perfil) VALUES
('Artista 1', 'Biografia do Artista 1', 'Brasil', 'imagem1.jpg'),
('Artista 2', 'Biografia do Artista 2', 'EUA', 'imagem2.jpg'),
('Artista 3', 'Biografia do Artista 3', 'Reino Unido', 'imagem3.jpg');

-- Inserir dados de exemplo na tabela de Álbuns
INSERT INTO Albuns (titulo, data_lancamento, capa) VALUES
('Album 1', '2005-05-01', 'capa1.jpg'),
('Album 2', '2015-08-20', 'capa2.jpg'),
('Album 3', '2008-11-15', 'capa3.jpg');

-- Inserir dados de exemplo na tabela de Músicas
INSERT INTO Musicas (titulo, duracao, data_lancamento, id_genero) VALUES
('Musica 1', '00:03:30', '2005-05-01', 1),
('Musica 2', '00:04:00', '2015-08-20', 2),
('Musica 3', '00:05:00', '2020-11-15', 3);

-- Inserir dados de exemplo na tabela de MúsicasAlbuns
INSERT INTO MusicasAlbuns (id_musica, id_album) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserir dados de exemplo na tabela de MúsicasArtistas
INSERT INTO MusicasArtistas (id_musica, id_artista) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 2); -- Colaboração entre Artista 1 e Artista 2

-- Inserir dados de exemplo na tabela de Usuários
INSERT INTO Usuarios (nome, email, data_nascimento, senha, plano_assinatura) VALUES
('Usuario 1', 'usuario1@example.com', '1990-01-01', 'senha1', 'gratuito'),
('Usuario 2', 'usuario2@example.com', '1985-02-02', 'senha2', 'premium'),
('Usuario 3', 'usuario3@example.com', '2000-03-03', 'senha3', 'gratuito');

-- Inserir dados de exemplo na tabela de Playlists
INSERT INTO Playlists (nome, data_criacao, visibilidade, id_usuario) VALUES
('Playlist 1', '2023-01-01', 'publica', 1),
('Playlist 2', '2023-02-01', 'privada', 2),
('Playlist 3', '2023-03-01', 'publica', 3);

-- Inserir dados de exemplo na tabela de MusicasPlaylists
INSERT INTO MusicasPlaylists (id_musica, id_playlist) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 2); -- Música 1 na Playlist 2

-- Inserir dados de exemplo na tabela de Comentários
INSERT INTO Comentarios (conteudo, id_usuario, id_musica) VALUES
('Ótima música!', 1, 1),
('Adorei essa música!', 2, 2),
('Muito boa!', 3, 3);

-- Inserir dados de exemplo na tabela de Eventos
INSERT INTO Eventos (nome, data, local, id_artista) VALUES
('Show do Artista 1', '2023-05-01', 'São Paulo', 1),
('Show do Artista 2', '2023-06-01', 'Rio de Janeiro', 2),
('Show do Artista 3', '2023-07-01', 'Belo Horizonte', 3);

-- Inserir dados de exemplo na tabela de Seguidores
INSERT INTO Seguidores (id_seguidor, id_seguido, tipo_seguido) VALUES
(1, 2, 'usuario'),
(2, 3, 'usuario'),
(3, 1, 'usuario');

-- Inserir dados de exemplo na tabela de Notificações
INSERT INTO Notificacoes (mensagem, id_usuario) VALUES
('Você tem um novo seguidor!', 1),
('Sua música foi adicionada a uma playlist!', 2),
('Você recebeu um novo comentário!', 3);

-- Inserir mais dados de exemplo na tabela de Músicas
INSERT INTO Musicas (titulo, duracao, data_lancamento, id_genero) VALUES
('Musica 4', '00:03:45', '2010-01-01', 1),
('Musica 5', '00:04:15', '2011-02-01', 2),
('Musica 6', '00:05:30', '2012-03-01', 3),
('Musica 7', '00:03:50', '2013-04-01', 1),
('Musica 8', '00:04:20', '2014-05-01', 2),
('Musica 9', '00:05:40', '2015-06-01', 3),
('Musica 10', '00:03:55', '2016-07-01', 1),
('Musica 11', '00:04:25', '2017-08-01', 2),
('Musica 12', '00:05:45', '2018-09-01', 3);

-- Inserir mais dados de exemplo na tabela de MúsicasArtistas
INSERT INTO MusicasArtistas (id_musica, id_artista) VALUES
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 2),
(11, 2),
(12, 2),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3);

-- Inserir mais dados de exemplo na tabela de MúsicasPlaylists
INSERT INTO MusicasPlaylists (id_musica, id_playlist) VALUES
(4, 1),
(5, 2),
(6, 3),
(7, 1),
(8, 2),
(9, 3),
(10, 1),
(11, 2),
(12, 3);