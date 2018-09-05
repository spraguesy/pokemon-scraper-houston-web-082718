require 'pry'

class Pokemon

    attr_accessor :name, :type, :id, :db, :hp

    def initialize (props={})
        @name = props['name']
        @type = props['type']
        @id = props['id']
        @db = props['db']
        @hp = props['hp']
    end

    def self.save (name, type, db)

        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?);
        SQL

        db.execute(sql, name, type)
        # binding.pry
    end

    def self.find (id, db)

        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL

        found = db.execute(sql, id)

        poke = found[0]

        new_poke = Pokemon.new('name' => poke[1], 'type' => poke[2], 'id' => poke[0], 'db' => db, 'hp' => poke[3])

        # binding.pry

    end

    def alter_hp (hp, db)

        sql = <<-SQL
            UPDATE pokemon SET hp = ? WHERE id = ?;
        SQL

        # binding.pry

        db.execute(sql, hp, self.id)

    end


end
