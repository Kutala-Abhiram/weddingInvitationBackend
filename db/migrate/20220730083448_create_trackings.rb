class CreateTrackings < ActiveRecord::Migration[7.0]
  def change
    create_table :trackings do |t|
      t.string :ipaddress
      t.datetime :date
      t.integer :source

      t.timestamps
    end
  end
end
