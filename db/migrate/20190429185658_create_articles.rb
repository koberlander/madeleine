class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :headline
      t.string :author
      t.string :snippet
      t.string :web_url

      t.timestamps
    end
  end
end
