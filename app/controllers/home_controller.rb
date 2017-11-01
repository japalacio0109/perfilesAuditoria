class HomeController < ApplicationController
  def index
    @gn_terc = GnTerc.all.count
    @re_prue = RePrue.all.count
    @au_dbau = AuDbau.all.count
  end
end
