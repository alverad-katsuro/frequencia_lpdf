class CreateFrequencia < ActiveRecord::Migration[7.0]
  def change
    create_table :frequencia do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :entrada
      t.datetime :saida
      t.boolean :fechou_o_ponto

      t.timestamps
    end
  end
end
