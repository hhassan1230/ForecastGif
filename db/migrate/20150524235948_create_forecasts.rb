class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
    	t.string :weather
    	t.integer :temp
    	t.float :lat
    	t.float :long
    	t.time :time
    	t.string :ip_address 
      t.timestamps null: false
    end
  end
end
