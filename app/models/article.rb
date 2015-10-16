class Article < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :title, :body
  validate  :picture_size

  # upload real-images 
  mount_uploader :picture, PictureUploader

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end
  
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  private 

    def picture_size
      if picture.size > 3.megabytes
        errors.add(:picture, "should be less than 3 MB")
      end
    end
end