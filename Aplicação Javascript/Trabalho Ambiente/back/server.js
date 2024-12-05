const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
const bodyParser = require("body-parser");
const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

const db = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "203Teresinha@",
    database: "SistemaMusical",
});

db.connect((err) => {
    if (err) throw err;
    console.log("Connected to the database");
});

app.post("/add-user", (req, res) => {
    const {
        id_usuario,
        nome,
        email,
        data_nascimento,
        senha,
        plano_assinatura,
    } = req.body;
    let sql;
    let params;

    if (id_usuario) {
        sql =
            "INSERT INTO Usuarios (id_usuario, nome, email, data_nascimento, senha, plano_assinatura) VALUES (?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE nome=?, email=?, data_nascimento=?, senha=?, plano_assinatura=?";
        params = [
            id_usuario,
            nome,
            email,
            data_nascimento,
            senha,
            plano_assinatura,
            nome,
            email,
            data_nascimento,
            senha,
            plano_assinatura,
        ];
    } else {
        sql =
            "INSERT INTO Usuarios (nome, email, data_nascimento, senha, plano_assinatura) VALUES (?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE nome=?, email=?, data_nascimento=?, senha, plano_assinatura=?";
        params = [
            nome,
            email,
            data_nascimento,
            senha,
            plano_assinatura,
            nome,
            email,
            data_nascimento,
            senha,
            plano_assinatura,
        ];
    }

    db.query(sql, params, (err, result) => {
        if (err) throw err;
        res.send("Usuário adicionado ou atualizado");
    });
});

app.get("/add-million-users", (req, res) => {
    let users = [];
    for (let i = 0; i < 1000000; i++) {
        const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
        users.push([
            `User${i}`,
            `user${i}-${uniqueSuffix}@example.com`,
            "2000-01-01",
            "password",
            "gratuito",
        ]);
    }

    const sql =
        "INSERT INTO Usuarios (nome, email, data_nascimento, senha, plano_assinatura) VALUES ?";

    db.beginTransaction((err) => {
        if (err) throw err;

        db.query(sql, [users], (err, result) => {
            if (err) {
                return db.rollback(() => {
                    throw err;
                });
            }

            db.commit((err) => {
                if (err) {
                    return db.rollback(() => {
                        throw err;
                    });
                }
                res.send("1 milhão de usuários adicionados");
            });
        });
    });
});

app.get("/add-fifty-users", (req, res) => {
    let users = [];
    for (let i = 0; i < 50; i++) {
        const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
        users.push([
            `User${i}`,
            `user${i}-${uniqueSuffix}@example.com`,
            "2000-01-01",
            "password",
            "gratuito",
        ]);
    }

    const sql =
        "INSERT INTO Usuarios (nome, email, data_nascimento, senha, plano_assinatura) VALUES ?";
    db.query(sql, [users], (err, result) => {
        if (err) throw err;
        res.send("50 usuários adicionados");
    });
});

app.get("/get-users", (req, res) => {
    const sql = "SELECT nome, email FROM Usuarios LIMIT 50";
    db.query(sql, (err, users) => {
        if (err) throw err;
        const countSql = "SELECT COUNT(*) AS total FROM Usuarios";
        db.query(countSql, (err, result) => {
            if (err) throw err;
            res.json({ users, total: result[0].total });
        });
    });
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
