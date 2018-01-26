class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
