class RemoveTitleFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :title, :string
  end
end
