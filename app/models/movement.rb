class Movement < ActiveRecord::Base
  attr_accessible :article_code, :movement_date, :quantity, :turnover, :user, :movement_type
  belongs_to :article
  
  acts_as_xlsx
  
    validates_presence_of :article_code, :quantity, :turnover, :movement_date

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      article = find_by_id(row["id"]) || new
      article.attributes = row.to_hash.slice(*accessible_attributes)
      if Article.where(:user => article.user, :article_code => article.article_code).empty?
        then raise "The article code #{article.article_code} does not exist, so the movement will not be saved. Movements before are saved, movements after are not."
      else article.save!
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
