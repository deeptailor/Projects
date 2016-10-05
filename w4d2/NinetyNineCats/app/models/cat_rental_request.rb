class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, presence: true
  validates :status, presence: true, inclusion: { in: %w(PENDING DENIED APPROVED),
      message: "%{value} not a status" }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :overlapping_approved_requests

  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :Cat


  def overlapping_requests
    @cats = Cat.all
    id = cat_id
    cat = @cats.find(id)
    cat.rental_requests.first.end_date >= :start_date ? true : false
  end

  def overlapping_approved_requests
    @cats = Cat.all
    if overlapping_requests
      id = cat_id
      found_cat = @cats.find(id)
      if found_cat.rental_requests.first.status == 'APPROVED'
        return true
      else
        return false
      end
    end
    false
  end
end
