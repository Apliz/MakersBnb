require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.query("SELECT * FROM spaces WHERE id = '#{id}';")
end