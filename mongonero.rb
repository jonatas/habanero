require 'mongo'
require 'mongo_record'

MongoRecord::Base.connection =
  Mongo::Connection.new.db('habanero')

class Pimenta < MongoRecord::Base
  fields :descricao, :picancia, :quantidade
end

class Pimenteiro < MongoRecord::Base
  field :email
  has_many :pimentas, :class_name => 'Pimenta' 
end
