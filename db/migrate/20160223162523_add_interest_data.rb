class AddInterestData < ActiveRecord::Migration
  def up
    execute("INSERT INTO interests (name, created_at, updated_at) VALUES
      ('fashion', now(), now()),
      ('food', now(), now()),
      ('entertainment', now(), now());")
  end

  def down
  end
end
