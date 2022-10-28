require 'repositories/post_repository'


def reset_posts_table
    seed_sql = File.read('spec/seeds_posts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end

describe PostRepository do
    before(:each) do 
        reset_posts_table
    end

    # (your tests will go here).
    context "all method" do
        it "return all the post" do
            repo = PostRepository.new

            posts = repo.all

            posts.length # => 3

            p posts
            p posts[0]
            expect(posts[0].id).to eq(1) # =>  1
            expect(posts[0].content).to eq('traveling') # =>  'traveling'
            expect(posts[0].creat_at).to eq('2019-12-20 22:03:33') # =>  '12/12/2019'
            expect(posts[0].user_id).to eq(2) # =>  2

        end
    end
end