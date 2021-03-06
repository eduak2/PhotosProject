class Post < ApplicationRecord
   belongs_to :user #de muhco a uno

   validates :description, presence: true
   has_attached_file :photo, styles: {}, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
    validates_attachment_presence :photo

end
