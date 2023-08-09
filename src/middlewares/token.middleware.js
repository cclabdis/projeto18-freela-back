import { acessToken } from "../repositories/user.repositories.js"


export async function validateToken(req, res, next) {
  const { authorization } = req.headers

  try{
  const token = authorization?.replace("Bearer ", "")
  const check = await acessToken(token)

  if (!token || check.rows.length ===0) {
    return res.sendStatus(401);
  }
  res.locals.token = token;

  next()
  } catch (err) {
    res.status(500).send(err.message);
}
}