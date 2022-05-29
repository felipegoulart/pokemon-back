import { EntitySchema } from "typeorm"

export default new EntitySchema({
  name: 'Pokemon',
  tableName: 'pokemon',
  columns: {
    id: {
      primary: true,
      type: 'int'
    },

    pokemon: {
      type: 'varchar'
    },

    type1: {
      type: 'varchar'
    },

    type2: {
      type: 'varchar'
    },

    hp: {
      type: 'int'
    },

    atk: {
      type: 'int'
    },

    def: {
      type: 'int'
    },

    spa: {
      type: 'int'
    },

    spd: {
      type: 'int'
    },

    spe: {
      type: 'int'
    },

    totalStatus: {
      type: 'int'
    }  
  }
})