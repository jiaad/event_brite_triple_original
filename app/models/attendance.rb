class Attendance < ApplicationRecord
  after_create :attendees_admin

  def attendees_admin
      AttendeesMailer.attend_email(self).deliver_now
    end

  validates :stripe_customer_id, presence: true
  belongs_to :event
  belongs_to :attendant , class_name: "User"



end
