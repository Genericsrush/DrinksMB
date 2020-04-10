class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.String :title
      t.Text :content
      t.String :permalink

      t.timestamps
    end
  end
end
