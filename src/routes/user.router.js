import { Router } from "express"
import validateSchema from "../middlewares/schema.middleware.js"
import { validateToken } from "../middlewares/token.middleware.js"
import { weinieController } from "../controllers/doguis.controllers.js"
import dogSchema from "../schemas/dog.schema.js"

const myDogsRouter = Router()

myDogsRouter.get("/me/", validateToken, weinieController.myIDs)
myDogsRouter.post("/me/newdog", validateToken, validateSchema(dogSchema), weinieController.create)
myDogsRouter.put("/me/:id", validateToken, weinieController.changeStatusById)
myDogsRouter.delete("/me/:id", validateToken, weinieController.deleteById)

export default myDogsRouter

