class DeviseTokenAuthChangePeople < ActiveRecord::Migration[5.0]
  def change
    change_table(:people) do |t|
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.json :tokens
    end
  end
end
