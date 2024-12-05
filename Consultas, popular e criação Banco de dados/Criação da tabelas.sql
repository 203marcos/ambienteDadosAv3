-- Criar o banco de dados
CREATE DATABASE SistemaMusical;
USE SistemaMusical;

-- Tabela de Usuários
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    plano_assinatura ENUM('gratuito', 'premium') DEFAULT 'gratuito'
);

-- Tabela de Gêneros Musicais
CREATE TABLE GenerosMusicais (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- Tabela de Músicas
CREATE TABLE Musicas (
    id_musica INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracao TIME NOT NULL,
    data_lancamento DATE,
    id_genero INT,
    FOREIGN KEY (id_genero) REFERENCES GenerosMusicais(id_genero)
);

-- Tabela de Álbuns
CREATE TABLE Albuns (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    data_lancamento DATE NOT NULL,
    capa VARCHAR(255)
);

-- Tabela de Artistas
CREATE TABLE Artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nome_artistico VARCHAR(100) NOT NULL,
    biografia TEXT,
    pais_origem VARCHAR(50),
    imagem_perfil VARCHAR(255)
);

-- Tabela de Playlists
CREATE TABLE Playlists (
    id_playlist INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_criacao DATE NOT NULL,
    visibilidade ENUM('publica', 'privada') DEFAULT 'privada',
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabela de Comentários
CREATE TABLE Comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    conteudo TEXT NOT NULL,
    data_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_usuario INT NOT NULL,
    id_musica INT DEFAULT NULL,
    id_playlist INT DEFAULT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_musica) REFERENCES Musicas(id_musica),
    FOREIGN KEY (id_playlist) REFERENCES Playlists(id_playlist)
);

-- Tabela de Eventos
CREATE TABLE Eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    local VARCHAR(100),
    id_artista INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista)
);

-- Tabela de Seguidores
CREATE TABLE Seguidores (
    id_seguidor INT NOT NULL,
    id_seguido INT NOT NULL,
    tipo_seguido ENUM('usuario', 'artista') NOT NULL,
    data_inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_seguidor, id_seguido, tipo_seguido),
    FOREIGN KEY (id_seguidor) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_seguido) REFERENCES Usuarios(id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela de Notificações
CREATE TABLE Notificacoes (
    id_notificacao INT AUTO_INCREMENT PRIMARY KEY,
    mensagem TEXT NOT NULL,
    data DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('lida', 'nao_lida') DEFAULT 'nao_lida',
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabelas intermediárias para relacionamentos N:M
-- Relacionamento Músicas e Álbuns
CREATE TABLE MusicasAlbuns (
    id_musica INT NOT NULL,
    id_album INT NOT NULL,
    PRIMARY KEY (id_musica, id_album),
    FOREIGN KEY (id_musica) REFERENCES Musicas(id_musica),
    FOREIGN KEY (id_album) REFERENCES Albuns(id_album)
);

-- Relacionamento Músicas e Artistas
CREATE TABLE MusicasArtistas (
    id_musica INT NOT NULL,
    id_artista INT NOT NULL,
    PRIMARY KEY (id_musica, id_artista),
    FOREIGN KEY (id_musica) REFERENCES Musicas(id_musica),
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista)
);

-- Relacionamento Músicas e Playlists
CREATE TABLE MusicasPlaylists (
    id_musica INT NOT NULL,
    id_playlist INT NOT NULL,
    PRIMARY KEY (id_musica, id_playlist),
    FOREIGN KEY (id_musica) REFERENCES Musicas(id_musica),
    FOREIGN KEY (id_playlist) REFERENCES Playlists(id_playlist)
);



