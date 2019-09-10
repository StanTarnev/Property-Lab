require('pg')

class Property

  attr_accessor :address, :value, :bedrooms, :type

  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @address = options['address']
    @value = options['value']
    @bedrooms = options['bedrooms'].to_i()
    @type = options['type']
  end

def save()
  db = PG.connect({ dbname: 'dream_home', host: 'localhost'})
  sql = "INSERT INTO dream_home (address, value, bedrooms, type) VALUES ($1, $2, $3, $4) RETURNING *"
  values = [@address, @value, @bedrooms, @type]
  db.prepare("save", sql)
  @id = db.exec_prepared("save", values)[0]['id'].to_i()
  db.close()
end

def delete()
  db = PG.connect({ dbname: 'dream_home', host: 'localhost'})
  sql = "DELETE FROM dream_home WHERE id = $1"
  values = [@id]
  db.prepare("delete", sql)
  db.exec_prepared("delete", values)
  db.close()
end

def update()
  db = PG.connect({ dbname: 'dream_home', host: 'localhost'})
  sql = "UPDATE dream_home SET (address, value, bedrooms, type) = ($1, $2, $3, $4) WHERE id = $5"
  values = [@address, @value, @bedrooms, @type, @id]
  db.prepare("update", sql)
  db.exec_prepared("update", values)
  db.close()
end

def Property.find(id)
  db = PG.connect({ dbname: 'dream_home', host: 'localhost'})
  sql = "SELECT * FROM dream_home WHERE id = $1"
  values = [id]
  db.prepare("find", sql)
  property_hash = db.exec_prepared("find", values)[0]
  db.close()
  return Property.new(property_hash)
end

def Property.find_by_address(address)
  db = PG.connect({ dbname: 'dream_home', host: 'localhost'})
  sql = "SELECT * FROM dream_home WHERE address = $1"
  values = [address]
  db.prepare("find_by_address", sql)
  property_hash = db.exec_prepared("find_by_address", values)[0]
  db.close()
  return Property.new(property_hash)
end

end
