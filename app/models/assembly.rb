class Assembly < ActiveRecord::Base
  has_many :sequences
  has_many :genes, through: :sequences
  has_many :hits, through: :genes




  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    # where("content LIKE ?", "%#{search}%")
  end


end
