class ChangeDueDateFormatInItems < ActiveRecord::Migration
     def up
      change_column :items, :due_date, 'datetime USING CAST(due_date AS timestamp with time zone 'epoch')'
    end

    def down
      change_column :items, :due_date, :time
    end
  end
