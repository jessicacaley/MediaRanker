class CreateHomepages < ActiveRecord::Migration[5.2]
  def change
    create_table :homepages do |t|
      t.string :show

      t.timestamps
    end
  end
end