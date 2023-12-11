import { v4 as uuid } from "uuid"
import bcrypt from "bcrypt"
import { authRepositories } from "../repositories/auth.repositories.js"

async function signUp(req, res) {
    const { name, cpf, phone, email, password, confirmPassword } = req.body
    if (password !== confirmPassword) {
        return res.status(400).send("Passwords do not match")
    }
    try {
        const hash = bcrypt.hashSync(password, 10)
        await authRepositories.users(name, cpf, phone, email, hash)
        res.sendStatus(201)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

async function signIn(req, res) {
    const { email, password } = req.body

    try {
        const user = await authRepositories.acessEmail(email)
        const token = uuid()
        const userID = user.rows[0].id

        await authRepositories.loginSucess(userID, token)
        res.status(200).send({ token, userID })

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export const authController = { signIn, signUp }