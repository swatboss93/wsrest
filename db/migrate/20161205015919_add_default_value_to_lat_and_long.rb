class AddDefaultValueToLatAndLong < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column_default :users, :latitude, 0
      change_column_default :users, :longitude, 0
    end

    def down
      change_column_default :users, :latitude, nil
      change_column_default :users, :longitude, nil
    end
  end
end
