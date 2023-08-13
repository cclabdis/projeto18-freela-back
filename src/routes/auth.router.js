import { Router } from "express"
import validateSchema from "../middlewares/schema.middleware.js"
import { loginSchema, userSchema } from "../schemas/user.schema.js"
import { validateLoginEmail, validateNewCpf, validateNewEmail } from "../middlewares/email.middleware.js"
import { signIn, signUp } from "../controllers/auth.controllers.js"

const authRouter = Router()

authRouter.post("/signup", validateSchema(userSchema),validateNewEmail, validateNewCpf, signUp )
authRouter.post("/signin",validateSchema(loginSchema), validateLoginEmail, signIn)

export default authRouter