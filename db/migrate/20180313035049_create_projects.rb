class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false, index: true
      t.text :content, null: false
      t.string :job_title, null: false
      t.integer :job_type, null: false, index: true
      # t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
