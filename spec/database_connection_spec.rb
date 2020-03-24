require 'database_connection'

describe DatabaseConnection do

  describe ".setup" do
    it "sets up a connection to the database through PG" do
      expect(PG).to receive(:connect).with(dbname: 'makers_bnb_test')

      DatabaseConnection.setup('makers_bnb_test')
    end

    it "is a persistent connection" do
      connection = DatabaseConnection.setup('makers_bnb_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('makers_bnb_test')

      expect(connection).to receive(:exec).with("SELECT * FROM spaces;")

      DatabaseConnection.query("SELECT * FROM spaces;")
    end
  end
end