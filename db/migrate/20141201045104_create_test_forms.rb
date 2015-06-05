class CreateTestForms < ActiveRecord::Migration
  def change
    create_table :test_forms do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
