class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :likes
  has_many :recipe_styles
  has_many :styles, through: :recipe_styles
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :chef_id, presence: true
  validates :name, presence: true,length:{minimum:3,maximum:50}
  validates :summary, presence: true,length:{minimum:5,maximum:150}
  validates :decsription, presence: true,length:{minimum:5,maximum:500}
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> {order(updated_at: :desc)}
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture,"should be less than 5mb")
      end
    end
end