class CreateDannis < ActiveRecord::Migration[5.1]
  def change
    create_table :dannis do |t|
      t.string :nomer
      t.string :text

      t.timestamps
    end
  end
end
