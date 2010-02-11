class CreateRecipients < ActiveRecord::Migration
  def self.up
    create_table :recipients do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.string :token
      t.boolean :active, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :recipients
  end
end
