class Private::Message < ApplicationRecord
  self.table_naem = 'private_messages'

  belongs_to :user
  belongs_to :conversation,
             class_name: 'Private::Conversation',
             foreign_key: :conversation_id
end
