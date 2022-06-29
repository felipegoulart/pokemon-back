/*
  Warnings:

  - You are about to drop the `Pokedex` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Pokemon` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PokemonsOnPokedex` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Type` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "PokemonsOnPokedex" DROP CONSTRAINT "PokemonsOnPokedex_pokedexId_fkey";

-- DropForeignKey
ALTER TABLE "PokemonsOnPokedex" DROP CONSTRAINT "PokemonsOnPokedex_pokemonId_fkey";

-- DropForeignKey
ALTER TABLE "_PokemonToType" DROP CONSTRAINT "_PokemonToType_A_fkey";

-- DropForeignKey
ALTER TABLE "_PokemonToType" DROP CONSTRAINT "_PokemonToType_B_fkey";

-- DropTable
DROP TABLE "Pokedex";

-- DropTable
DROP TABLE "Pokemon";

-- DropTable
DROP TABLE "PokemonsOnPokedex";

-- DropTable
DROP TABLE "Type";

-- CreateTable
CREATE TABLE "pokemons" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "health" INTEGER,
    "attack" INTEGER,
    "defense" INTEGER,
    "special_attack" INTEGER,
    "special_defense" INTEGER,
    "speed" INTEGER,
    "total" INTEGER,

    CONSTRAINT "pokemons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pokedex" (
    "id" TEXT NOT NULL,

    CONSTRAINT "pokedex_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pokemons_on_pokedex" (
    "pokemonId" INTEGER NOT NULL,
    "pokedexId" TEXT NOT NULL,

    CONSTRAINT "pokemons_on_pokedex_pkey" PRIMARY KEY ("pokedexId","pokemonId")
);

-- CreateTable
CREATE TABLE "types" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "types_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "pokemons_name_key" ON "pokemons"("name");

-- CreateIndex
CREATE UNIQUE INDEX "pokemons_on_pokedex_pokemonId_key" ON "pokemons_on_pokedex"("pokemonId");

-- CreateIndex
CREATE UNIQUE INDEX "types_id_key" ON "types"("id");

-- AddForeignKey
ALTER TABLE "pokemons_on_pokedex" ADD CONSTRAINT "pokemons_on_pokedex_pokemonId_fkey" FOREIGN KEY ("pokemonId") REFERENCES "pokemons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemons_on_pokedex" ADD CONSTRAINT "pokemons_on_pokedex_pokedexId_fkey" FOREIGN KEY ("pokedexId") REFERENCES "pokedex"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PokemonToType" ADD CONSTRAINT "_PokemonToType_A_fkey" FOREIGN KEY ("A") REFERENCES "pokemons"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PokemonToType" ADD CONSTRAINT "_PokemonToType_B_fkey" FOREIGN KEY ("B") REFERENCES "types"("id") ON DELETE CASCADE ON UPDATE CASCADE;
