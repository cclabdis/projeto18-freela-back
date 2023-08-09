import { Router } from "express"
import validateSchema from "../middlewares/validateSchema.middleware.js"
import { signIn, signUp } from "../controllers/auth.controllers.js"
import { loginSchema, userSchema } from "../schemas/user.schema.js"
import { validateLoginEmail, validateNewEmail } from "../middlewares/validateEmail.middleware.js"

const authRouter = Router()

authRouter.post("/signup", validateSchema(userSchema),validateNewEmail, signUp)
authRouter.post("/signin",validateSchema(loginSchema), validateLoginEmail, signIn)

export default authRouter