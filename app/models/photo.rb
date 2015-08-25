class Photo < ActiveRecord::Base

  belongs_to :visit
  has_many :likes
  has_many :comments

  has_attached_file :image,
  :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "/images/bond.jpg",
  bucket: 'moviesnaps',
  :url => ':s3_domain_url',
  :path => '/:class/:attachment/:id_partition/:style/:filename'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
