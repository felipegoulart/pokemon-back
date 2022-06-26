import express from 'express'
import multer from 'multer'

const csvToJson = require('convert-csv-to-json')
const upload = multer({ dest: './public/uploads' })
const app = express()

const PORT = 3000

app.use(express.json())

app.get('/', (req, res) => {
  res.json({ message: 'Hello World' })
})

app.listen(PORT, function () {
  console.log(`Server is running on port ${PORT}`)
});