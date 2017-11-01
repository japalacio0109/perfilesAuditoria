class GnTusu < ActiveRecord::Base
    self.table_name = 'gn_tusu'
    self.primary_key = :tus_cont

    has_many :gn_tercs, :class_name => 'GnTerc', :foreign_key => :tus_cont
end
