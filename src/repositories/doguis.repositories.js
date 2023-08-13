import { db } from "../database/database.connection.js"

export async function getAllDogs(email){ 
    return db.query(`SELECT * FROM doguitos;`)
}

export async function insertDog(name, photo_url, characteristics, contact_info, active, userID, hourly_rate){
    return db.query(`INSERT INTO doguitos (name, photo_url, characteristics, contact_info, active, owner_id, hourly_rate) 
        VALUES ($1, $2, $3, $4, $5, $6, $7)` ,
    [name, photo_url, characteristics, contact_info, active, userID, hourly_rate]);
}

export async function acessToken(token){ 
    return db.query(`SELECT * from tokens WHERE token = $1`,
    [token]);
}
export async function acessUser(usuario){ 
    return db.query(`SELECT * FROM users WHERE id=$1`,
    [usuario]);
}

export async function acessDog(id){
    return db.query(`SELECT * FROM doguitos WHERE id=$1`, 
    [id]);
}

export async function mydogs(userID){
    return db.query(`SELECT * FROM doguitos WHERE owner_id=$1;`, 
    [userID])
}

export async function deleteDogId(id){
    return db.query(`
    DELETE FROM doguitos WHERE id = $1;
      `, [id]);
}

export async function checkDog(id){
    return db.query(`
    SELECT * FROM doguitos WHERE id = $1
      `, [id]);
}
export async function changeStatus(active, id){
    return db.query(`
    UPDATE doguitos
    SET active = $1
    WHERE id = $2` , [active, id]);
}