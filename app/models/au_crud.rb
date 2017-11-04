class AuCrud < ActiveRecord::Base
    self.table_name = 'au_crud'
    self.primary_key = :cru_cont

    has_many :au_dbaus, :class_name => 'AuDbau', :foreign_key => :cru_cont
    has_many :au_dbauss, :class_name => 'AuDbau', :foreign_key => :cru_cont
end
