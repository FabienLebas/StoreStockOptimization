class Order < ActiveRecord::Base
  attr_accessible :article_code, :creation_date, :expected_delivery_date, :quantity, :supplier, :validated, :validation_date, :user

acts_as_xlsx

  validates_presence_of :article_code, :quantity, :expected_delivery_date, :supplier

def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    article = find_by_id(row["id"]) || new
    article.attributes = row.to_hash.slice(*accessible_attributes)
    if Article.where(:user => article.user, :article_code => article.article_code).empty?
      then format.html { redirect_to orders_path, :notice => "The article code #{article.article_code} does not exist, so the order will not be saved. Orders before are saved, orders after are not."} 
      else if Supplier.where(:user => article.user, :supplier => article.supplier).empty?
        then format.html { edirect_to orders_path, :notice => "The supplier code #{article.supplier} does not exist, so the order #{article.article_code} will not be saved. Orders before are saved, orders after are not."} 
        else article.save!
      end
    end
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
