class AuDbau < ActiveRecord::Base
    self.table_name = 'au_dbau'
    self.primary_key = :dba_cont

    belongs_to :au_crud, :class_name => 'AuCrud', :foreign_key => :cru_cont
    belongs_to :gn_terc, :class_name => 'GnTerc', :foreign_key => :ter_cont, optional: true
end
