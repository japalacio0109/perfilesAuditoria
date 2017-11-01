class GnTdoc < ActiveRecord::Base
    self.table_name = 'gn_tdoc'
    self.primary_key = :tdo_cont

    has_many :gn_tercs, :class_name => 'GnTerc', :foreign_key => :tdo_cont
end
