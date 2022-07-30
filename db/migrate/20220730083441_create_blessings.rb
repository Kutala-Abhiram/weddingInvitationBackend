class CreateBlessings < ActiveRecord::Migration[7.0]
  def change
    create_table :blessings do |t|
      t.string :name
      t.string :notes
      t.datetime :date
      t.string :ipaddress

      t.timestamps
    end
  end
end
