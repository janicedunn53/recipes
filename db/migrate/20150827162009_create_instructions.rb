class CreateInstructions < ActiveRecord::Migration
  def change
    create_table(:instructions) do |t|
      t.column(:instruction, :string)
      t.column(:recipe_id, :integer)

      t.timestamps()
    end
  end
end
