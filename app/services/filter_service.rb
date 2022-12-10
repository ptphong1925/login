class FilterService < ApplicationService
    def initialize(collection)
        @collection = collection
    end

    def filer_by_keyword(keyword, *field)
        if keyword.nil?
            return @collection
        else
            #Khai báo string rỗng
            filter_statement = ""
            #Tạo chuỗi string cho câu Query
            field.size.times { |n| filter_statement << "#{field[n-1]} LIKE :keyword OR " }
            #Loại bỏ " OR " ở chuỗi cuối cùng
            filter_statement = filter_statement[0..-5]
            #Thực hiện câu query
            @collection = @collection.where(filter_statement, keyword: "%"+keyword+"%")
            return @collection
        end
    end
end