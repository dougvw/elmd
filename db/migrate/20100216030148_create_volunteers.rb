class CreateVolunteers < ActiveRecord::Migration
  def self.up
    create_table :volunteers do |t|
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
      t.boolean :phone_calls
      t.boolean :distribute_signs
      t.boolean :write_letters
      t.boolean :host_event
      t.boolean :large_sign
      t.boolean :yard_sign
      t.boolean :office_help
      t.string :other

      t.timestamps
    end
  end

  def self.down
    drop_table :volunteers
  end
end
