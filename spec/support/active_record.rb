ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Schema.define do
  self.verbose = false
  create_table :articles, :force => true do |t|
    t.string :title
  end
end
