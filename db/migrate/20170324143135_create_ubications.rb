class CreateUbications < ActiveRecord::Migration[5.0]
  def change
    create_table :ubications do |t|
      t.text :link
      t.references :contribution, foreign_key: true

      t.timestamps
    end
  end
end
