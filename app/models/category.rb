class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :techniques, dependent: :destroy

  enum target_type: {blog: 0, news: 1, project: 2}
end
