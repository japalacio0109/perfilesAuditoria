class GnTerc < ActiveRecord::Base
    self.table_name = 'gn_terc'
    self.primary_key = :ter_cont

    has_many :au_dbaus, :class_name => 'AuDbau', :foreign_key => :ter_cont
    belongs_to :gn_tdoc, :class_name => 'GnTdoc', :foreign_key => :tdo_cont
    belongs_to :gn_tusu, :class_name => 'GnTusu', :foreign_key => :tus_cont
end
