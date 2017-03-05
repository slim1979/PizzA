class AddProducts < ActiveRecord::Migration[5.0]
  def change
    Product.create :title => 'Гавайская', :description => 'Очень вкусная Гавайская пицца!', :price => 350, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_img => '/img/HawaiianPizza.png'

    Product.create :title => 'Пепперони', :description => 'Попробуйте нашу Пепперони пиццу!', :price => 450, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => true, :path_to_img => '/img/pepperoni.png'

    Product.create :title => 'Вегетарианская', :description => 'Вегетарианская пицца - идеальный выбор вегетарианца!', :price => 300, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_img => '/img/veg.png'
    end
end
