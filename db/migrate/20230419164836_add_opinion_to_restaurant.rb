class AddOpinionToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :opinion, :string
  end
end
