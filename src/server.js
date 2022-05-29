import express from 'express'
import typeorm from 'typeorm'
import multer from 'multer'
import csvToJson from 'convert-csv-to-json'

const upload = multer({dest: './public/uploads'})

import Pokemon from './entities/Pokemon.js'

const app = express()

const options = {
    type: 'sqlite',
    database: './src/data/database.sqlite',
    entities: [Pokemon], 
    logging: true
}

const dataSource = new typeorm.DataSource(options)
const pokemonRepository = dataSource.getRepository('Pokemon')

app.use(express.json())

//Verbos HTTP
//GET - Receber dados de um Reourse
//POST - Envia dados ou informações para serem processados por um Resourse
//PUT- Atualizar dados de um resource
//DELETE - deletar um resource

app.get("/pokemons", async (req, res) => { 
  const allPokemons = pokemonRepository.find()  
  res.json(allPokemons)
})

app.post("/pokemons", upload.single('file'), async function(req, res){
    const pokemonsJson = csvToJson.fieldDelimiter(',').getJsonFromCsv(req.file.path)
    const pokemonsParsed = pokemonsJson?.map?.(pokemon => {
      return {
        id: pokemon['\"#\"'],
        'pokemon': pokemon['\"Pokemon\"'], 
        type1: pokemon['\"TypeI\"'],
        type2: pokemon['\"TypeII\"'],
        hp: pokemon['\"HP\"'],
        atk: pokemon['\"Atk\"'],
        def: pokemon['\"Def\"'],
        spa: pokemon['\"SpA\"'],
        spd: pokemon['\"SpD\"'],
        spe: pokemon['\"Spe\"'],
        totalStatus: pokemon['\"TotalStatus\"'],
      }
    })
    await pokemonRepository.save(pokemonsParsed)  

    res.json(pokemonsParsed)
})

app.listen(4000,function(){
    console.log('Server is running')

});