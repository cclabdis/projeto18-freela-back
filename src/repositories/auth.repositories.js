import { db } from "../database/database.connection.js"

export async function users(name, cpf, phone, email, hash){
    return  db.query(`
            INSERT INTO users (name, cpf, phone, email, password)
                VALUES ($1, $2, $3, $4, $5);
        `, [name, cpf, phone, email, hash])
}

export async function queryEmail(email){ 
    return  db.query(`SELECT * FROM users WHERE email=$1`, [email])
}

export async function queryCpf(cpf){ 
    return  db.query(`SELECT * FROM users WHERE cpf=$1`, [cpf])
}

export async function loginSucess(userID, token){ 
    return  db.query(`
    INSERT INTO tokens (user_id, token)
        VALUES ($1, $2);
`, [userID, token])
}


