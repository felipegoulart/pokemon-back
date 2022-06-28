import express from 'express'

const app = express()

const PORT = 3000

app.use(express.json())

app.get('/', (req, res) => {
  res.json({ message: 'Hello World' })
})

app.listen(PORT, function () {
  console.log(`Server is running on port ${PORT}`)
})
