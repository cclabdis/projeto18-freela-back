import { acessToken, acessUser } from "../repositories/doguis.repositories.js"


export async function validateToken(req, res, next) {
  const { authorization } = req.headers

  try{
    const token = authorization?.replace("Bearer ", "")
    const check = await acessToken(token)

    if (!token || check.rows.length ===0) return res.sendStatus(401)

    const {user_id: usuario } = check.rows[0]
    const user = await acessUser(usuario)
    if (!user.rows[0]) return res.sendStatus(401);
   

    res.locals.user = user.rows[0];
   next()
  } catch (err) {
    res.status(500).send(err.message)
}
}
