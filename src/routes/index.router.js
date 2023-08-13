import { Router } from "express"
import authRouter from "./auth.router.js"
import dogRouter from "./doguis.router.js"
import myDogsRouter from "./user.router.js"


const router = Router()

router.use(authRouter) 
router.use(dogRouter)
router.use(myDogsRouter)

export default router