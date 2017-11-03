class LogsController < ApplicationController
  before_action :profile, :auditor
  layout :resolve_layout

  def system
  end

end
