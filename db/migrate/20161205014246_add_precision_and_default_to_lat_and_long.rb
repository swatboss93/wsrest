class AddPrecisionAndDefaultToLatAndLong < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column :users, :latitude, :decimal, precision: 9, scale: 7, default: 0
      change_column :users, :longitude, :decimal, precision: 10, scale: 7, default: 0
    end

    def down
      change_column :users, :latitude, :decimal, :default => nil
      change_column :users, :longitude, :decimal, :default => nil
    end
  end
end
