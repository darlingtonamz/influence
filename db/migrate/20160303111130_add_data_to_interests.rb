class AddDataToInterests < ActiveRecord::Migration
  def change
    execute("INSERT INTO interests (name, created_at, updated_at) VALUES
      ('fashion', now(), now()),
      ('entertainment', now(), now()),
      ('food', now(), now())"
    );
  end
end
