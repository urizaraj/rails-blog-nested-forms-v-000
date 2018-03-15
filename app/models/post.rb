class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  accepts_nested_attributes_for :tags, reject_if: :all_blank

  def tag_attributes(atrs)
    atrs.values.each do |v|
      puts '******'
      puts v
      puts '******'
      self.tags << Tag.find_or_create_by(v)
    end
  end
end
