import { Router } from "express"
import validateSchema from "../middlewares/schema.middleware.js"
import { validateToken } from "../middlewares/token.middleware.js"


const dogRouter = Router()

dogRouter.post("/dog/newdog", validateSchema(), validateToken,  )
dogRouter.get("/dog/:id", )
dogRouter.get("/dog/alldogs", )
dogRouter.delete("/dog/:id", )

export default dogRouter