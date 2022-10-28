require 'repositories/user_repository'


def reset_users_table
    seed_sql = File.read('spec/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end
  
describe UserRepository do
    before(:each) do 
        reset_users_table
    end

# (your tests will go here).

    context "all method" do
        it "return a list of all the user" do
            repo = UserRepository.new

            users = repo.all

            expect(users.length).to eq(3) # => 3
            expect(users[0].id).to eq(1) # =>  1
            expect(users[0].name).to eq('Giorgio') # =>  'Giorgio'
            expect(users[0].email).to eq('giorgio.gristina@gmail.com') # =>  'giorgio.gristina@gmail.com'
            expect(users[0].username).to eq('giotheexplorer') # =>  'giotheexplorer'
            expect(users[0].password).to eq('123456') # =>  '123456'
        end
    end

    context "find method" do
        it "return one user" do
            repo = UserRepository.new

            user = repo.find(1)

           
            expect(user.id).to eq(1) # =>  1
            expect(user.name).to eq('Giorgio') # =>  'Giorgio'
            expect(user.email).to eq('giorgio.gristina@gmail.com') # =>  'giorgio.gristina@gmail.com'
            expect(user.username).to eq('giotheexplorer') # =>  'giotheexplorer'
            expect(user.password).to eq('123456') # =>  '123456'
        end
    end
end