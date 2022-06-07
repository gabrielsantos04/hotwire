class Contact < ApplicationRecord
  validates :name, presence: true

  after_create_commit -> {
    broadcast_append_to 'contacts_list',
    partial: "contacts/contact",
    locals: { contact: self },
    target: "contacts_list"
  }
end
