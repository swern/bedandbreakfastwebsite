require('pg')
require('pry-byebug')


class Bbw

  attr_reader(:first_name, :last_name, :nights, :check_in_date, :room_type, :breakfast, :id)

    def initialize (options)
      @first_name = options['first_name']
      @last_name = options['last_name']
      @nights = options['nights'].to_i
      @check_in_date = options['check_in_date']
      @room_type = options['room_type']
      @breakfast = options['breakfast']
      @id = options['id'].to_i
    end

    def self.all()
      db = PG.connect({dbname: 'bbw', host: 'localhost'})
      sql = "SELECT * FROM bbws"
      bbws = db.exec(sql)

      result = bbws.map {|bbw| Bbw.new(bbw)}
      db.close
      return result
    end

    def save()

      db = PG.connect({dbname: 'bbw', host: 'localhost'})
      sql = "INSERT INTO bbws (
        first_name,
        last_name,
        nights,
        check_in_date,
        room_type,
        breakfast
        ) VALUES
        ('#{@first_name}',
        '#{@last_name}',
        '#{@nights}',
        '#{@check_in_date}',
        '#{@room_type}',
        '#{@breakfast}') RETURNING *"
        bbw_data = db.exec(sql)
        db.close
        @id = bbw_data.first()['id'].to_i
      end

      def pretty_name()
        return @first_name.concat(" #{@last_name}")
      end

      def total()
        return @nights * 45
      end

      

  




end