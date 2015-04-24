class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file 	:image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
	else	
		has_attached_file 	:image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
		 					:storage => :dropbox,
	    					:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	    					:path => ":style/:id_:filename"
	end			
	# checking fields are not blank
	validates :name, :description, :price, presence: true
	# checking price is a positive number
	validates :price, numericality: { greater_than: 0 }
	# checking file selected for upload is an image - 2 methods:
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	#validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)			

	#defining the relationship listing to users db
	belongs_to :user
	has_many :orders
	belongs_to :category
end
