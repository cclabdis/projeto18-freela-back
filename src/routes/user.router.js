import { Router } from "express"
import validateSchema from "../middlewares/schema.middleware.js"
import { validateToken } from "../middlewares/token.middleware.js"
import { changeStatusById, createDog, deleteDog, getMyDogs } from "../controllers/doguis.controllers.js"
import dogSchema from "../schemas/dog.schema.js"


const myDogsRouter = Router()

myDogsRouter.get("/me/", validateToken, getMyDogs)
myDogsRouter.post("/me/newdog", validateToken, validateSchema(dogSchema), createDog)
myDogsRouter.put("/me/:id", validateToken, changeStatusById)
myDogsRouter.delete("/me/:id", validateToken, deleteDog )

export default myDogsRouter 

