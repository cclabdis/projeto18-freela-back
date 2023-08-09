import { Router } from "express"

const router = Router()

router.use(authRouter) 
router.use(dogRouter)
router.use(hiresRouter)

export default router