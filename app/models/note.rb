class Note < ApplicationRecord

  def self.add(name)
    Note.create(name: name)
  end

  def self.remove(id)
    Note.find(id).destroy
  end
end
