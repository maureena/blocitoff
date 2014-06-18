class ChangeDueDateFormatInItems < ActiveRecord::Migration
     def up
      change_column :items, :due_date, :datetime
    end

    def down
      change_column :items, :due_date, :time
    end
  end
