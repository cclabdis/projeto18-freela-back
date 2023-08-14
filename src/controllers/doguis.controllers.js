import { acessDog, changeStatus, checkDog, deleteDogId, getAllDogs, insertDog, mydogs } from "../repositories/doguis.repositories.js";

export async function getDogs(req, res) {
    try {
        const dogs = await getAllDogs()
        const activeDogs = dogs.rows.filter(dog => dog.active === 'ativo');
        res.send(activeDogs);

    } catch (error) {
        res.status(500).send(error.message)
    }
}
export async function getDogsById(req, res) {
    const { id } = req.params
    try {
        const dog = await acessDog(id)
        if (dog.rowCount === 0) return res.sendStatus(404)
        res.send(dog)
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function getMyDogs(req, res) {
    const { user } = res.locals
    try {
        const userID = user.id
        const dog = await mydogs(userID)
        res.send(dog)
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function createDog(req, res) {
    const { name, photo_url, characteristics, contact_info, active, hourly_rate } = req.body

    try {
        const { user } = res.locals
        const userID = user.id
        await insertDog(name, photo_url, characteristics, contact_info, active, userID, hourly_rate)
        res.sendStatus(201)

    } catch (err) {
        res.status(499).send(err.message)
    }
}

export async function deleteDog(req, res) {
    const { id } = req.params
    const { user } = res.locals

    try {
        const check = await checkDog(id)
        if (check.rowCount === 0) return res.sendStatus(404)

        await deleteDogId(id)
        res.status(204).send("Excluido com sucesso")

    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function changeStatusById(req, res) {
    const { id } = req.params
    const { user } = res.locals
    const { active } = req.body
    try {
        const check = await checkDog(id)
        if (check.rowCount === 0) return res.sendStatus(401)

        await changeStatus(active, id)
        res.status(204).send("Status alterado")

    } catch (err) {
        res.status(500).send(err.message);
    }
}
