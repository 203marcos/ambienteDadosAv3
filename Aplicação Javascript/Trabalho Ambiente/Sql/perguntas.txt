-- 1) Liste os nomes de todos os usuários que têm pelo menos uma música em sua playlist que
-- pertence a um álbum lançado antes de 2010. Exiba o nome do usuário e o nome do álbum.
SELECT DISTINCT u.nome AS nome_usuario, a.titulo AS nome_album
FROM Usuarios u
JOIN Playlists p ON u.id_usuario = p.id_usuario
JOIN MusicasPlaylists mp ON p.id_playlist = mp.id_playlist
JOIN Musicas m ON mp.id_musica = m.id_musica
JOIN MusicasAlbuns ma ON m.id_musica = ma.id_musica
JOIN Albuns a ON ma.id_album = a.id_album
WHERE a.data_lancamento < '2010-01-01';
-- 2) Mostre o número total de músicas que cada artista tem, juntamente com o nome do artista. Exiba
-- apenas os artistas com mais de 5 músicas.
SELECT a.nome_artistico, COUNT(ma.id_musica) AS total_musicas
FROM Artistas a
JOIN MusicasArtistas ma ON a.id_artista = ma.id_artista
GROUP BY a.nome_artistico
HAVING COUNT(ma.id_musica) > 5;
-- 3) Liste os artistas que têm pelo menos uma colaboração com outro artista em alguma música.
-- Exiba o nome artístico do artista e o nome do colaborador.
SELECT DISTINCT a1.nome_artistico AS artista, a2.nome_artistico AS colaborador
FROM MusicasArtistas ma1
JOIN MusicasArtistas ma2 ON ma1.id_musica = ma2.id_musica AND ma1.id_artista != ma2.id_artista
JOIN Artistas a1 ON ma1.id_artista = a1.id_artista
JOIN Artistas a2 ON ma2.id_artista = a2.id_artista;
-- 4) Liste os nomes dos usuários que não têm nenhuma música em suas playlists que seja de um
-- artista específico. Exiba o nome do usuário.
SELECT DISTINCT u.nome
FROM Usuarios u
WHERE u.id_usuario NOT IN (
    SELECT p.id_usuario
    FROM Playlists p
    JOIN MusicasPlaylists mp ON p.id_playlist = mp.id_playlist
    JOIN MusicasArtistas ma ON mp.id_musica = ma.id_musica
    WHERE ma.id_artista = (SELECT id_artista FROM Artistas WHERE nome_artistico = 'Nome do Artista Específico')
);
-- 5) Encontre os 3 álbuns mais populares, ou seja, os álbuns com mais músicas salvas nas playlists de
-- todos os usuários. Exiba o título do álbum e o número de músicas que estão em playlists. 
SELECT a.titulo, COUNT(mp.id_musica) AS total_musicas
FROM Albuns a
JOIN MusicasAlbuns ma ON a.id_album = ma.id_album
JOIN MusicasPlaylists mp ON ma.id_musica = mp.id_musica
GROUP BY a.titulo
ORDER BY total_musicas DESC
LIMIT 3;
