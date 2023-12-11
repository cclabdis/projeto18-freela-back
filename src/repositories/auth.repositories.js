import { db } from "../database/database.connection.js"

async function users(name, cpf, phone, email, hash) {
    return db.query(`
            INSERT INTO users (name, cpf, phone, email, password)
                VALUES ($1, $2, $3, $4, $5);
        `, [name, cpf, phone, email, hash])
}

async function acessEmail(email) {
    return db.query(`SELECT * FROM users WHERE email=$1`, [email])
}

async function acessCpf(cpf) {
    return db.query(`SELECT * FROM users WHERE cpf=$1`, [cpf])
}

async function loginSucess(userID, token) {
    return db.query(`
    INSERT INTO tokens (user_id, token)
        VALUES ($1, $2);
`, [userID, token])
}



export const authRepositories = {users, acessCpf, acessEmail, loginSucess}