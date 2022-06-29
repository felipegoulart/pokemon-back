-- CreateTable
CREATE TABLE "Pokemon" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "health" INTEGER,
    "attack" INTEGER,
    "defense" INTEGER,
    "special_attack" INTEGER,
    "special_defense" INTEGER,
    "speed" INTEGER,
    "total" INTEGER,

    CONSTRAINT "Pokemon_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pokedex" (
    "id" TEXT NOT NULL,

    CONSTRAINT "Pokedex_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PokemonsOnPokedex" (
    "pokemonId" INTEGER NOT NULL,
    "pokedexId" TEXT NOT NULL,

    CONSTRAINT "PokemonsOnPokedex_pkey" PRIMARY KEY ("pokedexId","pokemonId")
);

-- CreateTable
CREATE TABLE "Type" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "Type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_PokemonToType" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Pokemon_name_key" ON "Pokemon"("name");

-- CreateIndex
CREATE UNIQUE INDEX "PokemonsOnPokedex_pokemonId_key" ON "PokemonsOnPokedex"("pokemonId");

-- CreateIndex
CREATE UNIQUE INDEX "Type_id_key" ON "Type"("id");

-- CreateIndex
CREATE UNIQUE INDEX "_PokemonToType_AB_unique" ON "_PokemonToType"("A", "B");

-- CreateIndex
CREATE INDEX "_PokemonToType_B_index" ON "_PokemonToType"("B");

-- AddForeignKey
ALTER TABLE "PokemonsOnPokedex" ADD CONSTRAINT "PokemonsOnPokedex_pokemonId_fkey" FOREIGN KEY ("pokemonId") REFERENCES "Pokemon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PokemonsOnPokedex" ADD CONSTRAINT "PokemonsOnPokedex_pokedexId_fkey" FOREIGN KEY ("pokedexId") REFERENCES "Pokedex"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PokemonToType" ADD CONSTRAINT "_PokemonToType_A_fkey" FOREIGN KEY ("A") REFERENCES "Pokemon"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PokemonToType" ADD CONSTRAINT "_PokemonToType_B_fkey" FOREIGN KEY ("B") REFERENCES "Type"("id") ON DELETE CASCADE ON UPDATE CASCADE;
