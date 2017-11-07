class LogsController < ApplicationController
  before_action :profile, :auditor
  layout :resolve_layout

  def system
    @t_result = AuDbau.all.page params[:page]
    @t_field = ["Nº","Fecha/Hora","Tipo de Petición","Ruta de Acceso","IP - Nombre Equipo","Usuario","Parámetros","Datos de Proceso","Estado"]
    # BETWEEN COALESCE(B.start_date,'1900-01-01') and COALESCE(B.end_date,CURRENT_TIMESTAMP)

  end

  def General
    #code
  end

  def byDate
    #code
  end

  def byUsua
    #code
  end

  def byRequest
    #code
  end

  def byCrud
    #code
  end

  def byState
    #code
  end

end
