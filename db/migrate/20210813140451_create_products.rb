class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.string :img_link,
        default: "http://bandeiraimoveis-ba.com.br/application/modules/themes/views/default/assets/images/image-placeholder.png"
      t.timestamps
    end
  end
end
