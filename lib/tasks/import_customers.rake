require 'csv'

namespace :import_everything do
  task :create_everything => :environment do
    file = File.read('./db/data/customers.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      customer = Customer.create!(row.to_hash)
      puts "created customer #{customer.id}"
    end

    file = File.read('./db/data/merchants.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      merchant = Merchant.create!(row.to_hash)
      puts "created merchant #{merchant.id}"
    end

    file = File.read('./db/data/items.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      item = Item.create!(row.to_hash)
      puts "created item #{item.id}"
    end

    file = File.read('./db/data/invoices.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      invoice = Invoice.create!(row.to_hash)
      puts "created invoice #{invoice.id}"
    end

    file = File.read('./db/data/invoice_items.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      invoice_item = InvoiceItem.create!(row.to_hash)
      puts "created invoice_item #{invoice_item.id}"
    end

    file = File.read('./db/data/transactions.csv')
    csv = CSV.parse(file, :headers => true, :header_converters => :symbol)
    csv.each do |row|
      transaction = Transaction.create!(
        credit_card_number: row[:credit_card_number],
        result: row[:result],
        invoice_id: row[:invoice_id],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      )
      puts "created transaction #{transaction.id}"
    end
  end
end