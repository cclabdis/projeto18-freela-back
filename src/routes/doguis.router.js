import { Router } from "express"
import {  getDogs, getDogsById } from "../controllers/doguis.controllers.js"

const dogRouter = Router()

dogRouter.get("/dog", getDogs)
dogRouter.get("/dog/:id", getDogsById)

export default dogRouter