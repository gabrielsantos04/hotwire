class Contact < ApplicationRecord
  validates :name, presence: true

  after_create_commit -> {
    broadcast_append_to 'contacts_list',
    partial: "contacts/contact",
    locals: { contact: self },
    target: "contacts_list"
  }

  after_create_commit -> { broadcast_update_to 'contacts_list', html: Contact.count, target: "contacts_size" }
end
