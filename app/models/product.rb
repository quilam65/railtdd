class Product < ApplicationRecord
  before_save :strip_html_from_description
  before_save :set_all_title_lower_case
  before_save :title_is_shorter_than_description

  validates :title ,:description, presence: true
  validates :price, numericality: { greater_than: 0 }
  belongs_to :category

  mount_uploader :image, ImageUploader

  def strip_html_from_description
    self.description =
      ActionView::Base.full_sanitizer.sanitize(self.description)
  end

  def set_all_title_lower_case
    self.title = self.title.downcase
  end


  def title_is_shorter_than_description
    return if title.blank? or description.blank?
    if description.length < title.length
      errors.add(:description, 'can\'t be shorter than title' )
    end
  end
end
