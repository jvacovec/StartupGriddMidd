class CreateGoogleCredentials < ActiveRecord::Migration
  def change
    create_table :google_credentials do |t|
      t.string :credentials
      t.timestamps null: false
    end
  end
end
