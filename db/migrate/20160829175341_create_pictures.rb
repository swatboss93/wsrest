class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.references :user, foreign_key: true
      t.string :path_to_picture

      t.timestamps
    end
  end
end
