class Project < ApplicationRecord
  belongs_to :category
  has_many :feedbacks, dependent: :destroy
  has_many :participates, dependent: :destroy
  has_many :users, through: :participates
  has_many :messages, dependent: :destroy
  has_many :likes, as: :target
  has_many :images, as: :target
  has_many :targettechniques, as: :target
  has_many :comments, as: :target

  scope :order_by_newest, ->{order created_at: :desc}

  accepts_nested_attributes_for :images, allow_destroy: true


  validates :name, presence: true,
   length: {maximum: Settings.project.name_length}
  validates :description, presence: true,
   length: {maximum: Settings.project.description_length}
  validates :core_features, presence: true,
   length: {maximum: Settings.project.core_features_length}
  ratyrate_rateable :rating

  PRIVATE_ATTRIBUTES = {git_repository: "git_repository", url: "url"}

  BRANCH = [[Settings.branch.hanoi, 0],[Settings.branch.danang, 1]]
  private

  def check_max_files
    if images.blank? || images.size > Settings.project.max_image_files
      errors.add(:dagger, I18n.t("projects.check_max_files"))
    end
  end

  def self.get_follow_category category_id
    where(category_id: category_id) unless category_id.nil?
  end

  def self.show_for_rating
    Project.all.sort_by {|u| [u.average(:rating) ? u.average(:rating).avg : 0, u.average(:rating)]}.reverse
  end
end
