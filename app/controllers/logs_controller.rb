class LogsController < ApplicationController
  layout :admin
  before_action :profile

  def system
  end

  def auditDB
  end
end
