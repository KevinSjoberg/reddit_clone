class CreateLinksTable < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.references :user
    end
  end
end
