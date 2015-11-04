require 'csv'

namespace :import_csv_data do
 task create_data: :environment do

   csv_data = File.read("public/csv_data/merchants.csv")
   csv = CSV.parse(csv_data, headers: true)
   csv.each do |row|
     Merchant.create!(row.to_hash)
   end

   csv_data = File.read("public/csv_data/items.csv")
   csv = CSV.parse(csv_data, headers: true)
   csv.each do |row|
     Item.create!(row.to_hash)
   end

   csv_data = File.read("public/csv_data/customers.csv")
   csv = CSV.parse(csv_data, headers: true)
   csv.each do |row|
     Customer.create!(row.to_hash)
   end

   csv_data = File.read("public/csv_data/invoices.csv")
   csv = CSV.parse(csv_data, headers: true)
   csv.each do |row|
     Invoice.create!(row.to_hash)
   end

   csv_data = File.read("public/csv_data/invoice_items.csv")
   csv = CSV.parse(csv_data, headers: true)
   csv.each do |row|
     InvoiceItem.create!(row.to_hash)
   end

   csv_data = File.read("public/csv_data/transactions.csv")
   csv = CSV.parse(csv_data, headers: true)
   csv.each do |row|
     Transaction.create!(row.to_hash)
   end
 end
end
