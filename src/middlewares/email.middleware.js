import { queryCpf } from "../repositories/auth.repositories.js";
import { queryEmail } from "../repositories/auth.repositories.js"
import bcrypt from "bcrypt"

export async function validateNewEmail(req, res, next) {
    const { email } = req.body;
    try {
        const user = await queryEmail(email)
        if (user.rowCount === 1) return res.status(477).send("Email já cadastrado");
        next();
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function validateNewCpf(req, res, next) {
    const { cpf } = req.body;
    try {
        const user = await queryCpf(cpf)
        if (user.rowCount === 1) return res.status(477).send("CPF já cadastrado");
        next();
    } catch (err) {
        res.status(477).send(err.message);
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