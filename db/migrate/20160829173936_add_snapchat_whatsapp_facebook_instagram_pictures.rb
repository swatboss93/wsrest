class AddSnapchatWhatsappFacebookInstagramPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :snapchat, :string
    add_column :users, :whatsapp, :string
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
  end
end
