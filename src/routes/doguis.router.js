import { Router } from "express"
import { weinieController } from "../controllers/doguis.controllers.js"

const dogRouter = Router()

dogRouter.get("/dog", weinieController.getAll)
dogRouter.get("/dog/:id", weinieController.getById)

export default dogRouter