class CreateComments < ActiveRecord::Migration[5.1]
  def change
    # drop_table :comments
    create_table :comments do |t|
      t.string :author_name
      t.text :body
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
