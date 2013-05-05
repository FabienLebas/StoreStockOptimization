class Supplier < ActiveRecord::Base
  attr_accessible :leadtime, :order_minimum_qty, :order_minimum_value, :supplier, :supplier_text, :user
  has_many :users
  has_many :articles
  
  acts_as_xlsx
  
    validates_presence_of :leadtime
  
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      supplier = find_by_id(row["id"]) || new
      supplier.attributes = row.to_hash.slice(*accessible_attributes)
      supplier.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
end
