class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :credit_card_number, :result, :invoice_id, :result,
             :created_at, :updated_at
end
