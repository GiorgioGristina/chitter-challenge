require_relative '../model/post'

class PostRepository
    def all
        sql = 'SELECT * FROM posts;'
        data = DatabaseConnection.exec_params(sql, [])
        posts = []
        data.each do |record|
            posts << create_post_instance(record)
        end
        return posts
    end

    private

    def create_post_instance(post_hash)
        p post_hash
        post = Post.new()
        post.id = post_hash['id'].to_i
        post.content = post_hash['content']
        post.creat_at = post_hash['creat_at']
        post.user_id = post_hash['user_id'].to_i
        return post
    end
end