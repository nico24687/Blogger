class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      #notice that we use t to denote the articles table

      t.string :title
      t.text :body
      #the above in effect add a title column and a body column to the articles table
      t.timestamps
      #this will create two columns in the table. One for created at. The other for updated at
    end
  end
end
