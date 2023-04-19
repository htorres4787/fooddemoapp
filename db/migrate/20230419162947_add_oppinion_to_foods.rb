class AddOppinionToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :opinion, :string
  end
end
