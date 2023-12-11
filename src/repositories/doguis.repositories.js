import { db } from "../database/database.connection.js"

async function getAllDogs(email) {
    return db.query(`SELECT * FROM doguitos;`)
}

async function create(name, photo_url, characteristics, contact_info, active, userID, hourly_rate) {
    return db.query(`INSERT INTO doguitos (name, photo_url, characteristics, contact_info, active, owner_id, hourly_rate) 
        VALUES ($1, $2, $3, $4, $5, $6, $7)` ,
        [name, photo_url, characteristics, contact_info, active, userID, hourly_rate]);
}

async function acessToken(token) {
    return db.query(`SELECT * from tokens WHERE token = $1`,
        [token]);
}

async function acessUser(user_id) {
    return db.query(`SELECT * FROM users WHERE id=$1`,
        [user_id]);
}

async function acessByID(id) {
    return db.query(`SELECT * FROM doguitos WHERE id=$1`,
        [id]);
}

async function getMyIDs(userID) {
    return db.query(`SELECT * FROM doguitos WHERE owner_id=$1;`,
        [userID])
}

async function deleteById(id) {
    return db.query(`
    DELETE FROM doguitos WHERE id = $1;
      `, [id]);
}

async function checkById(id) {
    return db.query(`
    SELECT * FROM doguitos WHERE id = $1
      `, [id]);
}

async function changeStatus(active, id) {
    return db.query(`
    UPDATE doguitos
    SET active = $1
    WHERE id = $2` , [active, id]);
}

export const weinieRepositories = { changeStatus, deleteById, checkById, getMyIDs, getAllDogs, acessByID, create, acessUser, acessToken }