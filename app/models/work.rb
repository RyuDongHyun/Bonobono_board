class Work < ActiveRecord::Base
    belongs_to :maker
    mount_uploader(:image, ImageUploader)
    validates_presence_of :image
    
    validates(:title, presence: true)
    validates(:desc, length: {minimum: 1, maximum: 100})
    validates(:image, presence: true)
end
