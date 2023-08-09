
import { queryEmail } from "../repositories/auth.repositories.js"
import bcrypt from "bcrypt"

export async function validateNewEmail(req, res, next) {
    const { email } = req.body;
    try {
        const user = await queryEmail(email)
        if (user.rowCount === 1) return res.sendStatus(409);
        next();
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function validateLoginEmail(req, res, next) {
    const { email, password } = req.body;
    try {
       
        
        const user = await queryEmail(email)
        if (!user.rows.length) return res.sendStatus(401)      
    
        const storedPasswordHash = user.rows[0].password
        const isPasswordCorrect = bcrypt.compareSync(password, storedPasswordHash)
        if (!isPasswordCorrect)return res.sendStatus(401)
    

        next();
    } catch (err) {
        res.status(500).send(err.message);
    }
}