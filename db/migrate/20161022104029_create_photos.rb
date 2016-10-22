class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.belongs_to :artist, index: true
      t.string :image

      t.timestamps
    end
  end
end
