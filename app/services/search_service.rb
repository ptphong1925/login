class SearchService < ApplicationService

    def self.by_keyword(collection, keyword, *field)
        if keyword.nil?
            collection
        else
            keyword = keyword.downcase
            #Khai báo string rỗng
            filter_statement = ""
            #Tạo chuỗi string cho câu Query
            field.size.times { |n| filter_statement << "#{field[n-1]} LIKE :keyword OR " }
            #Loại bỏ " OR " ở chuỗi cuối cùng
            filter_statement = filter_statement[0..-5]
            #Thực hiện câu query
            collection = collection.where(filter_statement, keyword: "%"+keyword+"%")
            collection
        end
    end

    def self.by_date(collection, field, start_date: , end_date:)
      if start_date.nil? && end_date.nil?
        collection
      else
        collection = collection.where('#{field} > ?', start_date) if start_date.present?
        collection = collection.where('#{field} < ?', end_date) if end_date.present?
        collection
    end

end