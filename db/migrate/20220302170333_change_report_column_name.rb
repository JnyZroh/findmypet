class ChangeReportColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :reports, :type, :report_type
  end
end
