class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string :title
      t.text :body
      t.integer :order_number
      t.boolean :active, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
