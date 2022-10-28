require_relative '../model/user'

class UserRepository
    def all
        sql = 'SELECT * FROM users'
        data = DatabaseConnection.exec_params(sql, [])
        users = []
        data.each do |record|
            users << create_user_instance(record)
        end
        return users
    end
    
    def find(id)
        sql = 'SELECT * FROM users WHERE id = $1'
        data = DatabaseConnection.exec_params(sql, [id])[0]
        return create_user_instance(data)
    end

    private

    def create_user_instance(user_hash)
        user = User.new()
        user.id = user_hash['id'].to_i
        user.name = user_hash['name']
        user.username = user_hash['username']
        user.email = user_hash['email']
        user.password = user_hash['password']
        return user
    end

end