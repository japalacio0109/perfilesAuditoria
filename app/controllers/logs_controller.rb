class LogsController < ApplicationController
  before_action :profile, :auditor
  layout :resolve_layout

  def system
    @t_result = AuDbau.all
    @t_field = ["Nº","Fecha/Hora","Tipo de Petición","Ruta de Acceso","IP - Nombre Equipo","Usuario","Parámetros","Datos de Proceso","Estado"]
  end

end
