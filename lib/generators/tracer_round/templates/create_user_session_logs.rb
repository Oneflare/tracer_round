class CreateUserSessionLogs < ActiveRecord::Migration
  def self.up
    create_table :user_session_logs do |t|
      t.integer :user_id
      t.string :origin_ip
      t.string :origin_country
      t.string :action
      t.timestamps
    end
  end

  def self.down
    drop_table :user_session_logs
  end
end
