import { acessDog, changeStatus, checkDog, deleteDogId, getAllDogs, insertDog, mydogs, weinieRepositories } from "../repositories/doguis.repositories.js";

async function getAll(req, res) {
    try {
        const dogs = await weinieRepositories.getAllDogs()
        const activeDogs = dogs.rows.filter(dog => dog.active === 'ativo');
        res.send(activeDogs);

    } catch (error) {
        res.status(500).send(error.message)
    }
}

async function getById(req, res) {
    const { id } = req.params
    try {
        const dog = await weinieRepositories.acessByID(id)
        if (dog.rowCount === 0) return res.sendStatus(404)
        res.send(dog)
    } catch (error) {
        res.status(500).send(error.message)
    }
}

async function myIDs(req, res) {
    const { user } = res.locals
    try {
        const userID = user.id
        const dog = await weinieRepositories.getMyIDs(userID)
        res.send(dog)
    } catch (error) {
        res.status(500).send(error.message)
    }
}

async function create(req, res) {
    const { name, photo_url, characteristics, contact_info, active, hourly_rate } = req.body

    try {
        const { user } = res.locals
        const userID = user.id
        await weinieRepositories.create(name, photo_url, characteristics, contact_info, active, userID, hourly_rate)
        res.sendStatus(201)

    } catch (err) {
        res.status(499).send(err.message)
    }
}

async function deleteById(req, res) {
    const { id } = req.params
    const { user } = res.locals

    try {
        const check = await weinieRepositories.checkById(id)
        if (check.rowCount === 0) return res.sendStatus(404)

        await weinieRepositories.deleteById(id)
        res.status(204).send("Excluido com sucesso")

    } catch (err) {
        res.status(500).send(err.message);
    }
}

async function changeStatusById(req, res) {
    const { id } = req.params
    const { user } = res.locals
    const { active } = req.body
    try {
        const check = await weinieRepositories.checkById(id)
        if (check.rowCount === 0) return res.sendStatus(401)

        await weinieRepositories.changeStatus(active, id)
        res.status(204).send("Status alterado")

    } catch (err) {
        res.status(500).send(err.message);
    }
}


export const weinieController = { getAll, getById, myIDs, create, changeStatusById, deleteById }