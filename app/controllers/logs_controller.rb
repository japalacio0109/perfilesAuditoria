class LogsController < ApplicationController
  before_action :profile, :auditor
  layout :resolve_layout

  def system
    if params[:fini] or params[:usua] or params[:request] or params[:crud] or params[:state]
      result = "1=1"
      arr = []
      if params[:fini] != nil and params[:fini] != "" and params[:fina] != nil and params[:fina] != ""
        if params[:fini].include? "T"
          params[:fini] = params[:fini].sub! 'T',' '
        end
        if params[:fina].include? "T"
          params[:fina] = params[:fina].sub! 'T',' '
        end
        if params[:fini] < params[:fina]
          # result += " AND dba_fech BETWEEN '#{params[:fini]}' and '#{params[:fina]}'"
          if params[:fini] <= Time.now
            if  params[:fina] <= Time.now
              fina = "'#{params[:fina]}'"
            else
              fina = "NOW()"
            end
            p fina
            result += " AND dba_fech BETWEEN '#{params[:fini]}' and #{fina}"
          else
            flash[:danger] = "Error de ingreso de fecha, el rango que se especifica es mayor a la fecha actual"
            redirect_to logs_url
          end
        else
          flash[:danger] = "Error de ingreso de fecha, la fecha inicial debe ser menor a la final"
          redirect_to logs_url
        end


      end
      if params[:usua] != nil and params[:usua] != ""
        result += " AND ter_cont IN (SELECT ter_cont FROM gn_terc WHERE gn_terc.ter_usua like '%#{params[:usua]}%')"

      end
      if params[:request] != nil and params[:request] != ""
        result += " AND cru_cont = #{params[:request]} "
      end
      if params[:crud] != nil and params[:crud] != ""
        # @t_result = AuDbau.where("dba_fech BETWEEN COALESCE(?,'1900-01-01') and COALESCE(?,CURRENT_TIMESTAMP) AND ter_cont IN (SELECT ter_cont FROM gn_terc WHERE gn_terc.ter_cont = ?) AND cru_cont LIKE '%?%' AND dba_dpro LIKE '%?%' AND dba_aprob LIKE '%?%' ", params[:fini],params[:fina],params[:usua],params[:request],params[:crud],params[:state]).page params[:page]
        result += " AND dba_dpro = #{params[:crud]}"
      end

      if params[:state] != nil and params[:state] != ""
        result += " AND dba_aprob= #{params[:state]}"
      end
      p result
      p arr
      @t_result = AuDbau.where("#{result}").page params[:page]
    else
      @t_result = AuDbau.all.page params[:page]

    end
    if @t_result.count == 0
      flash[:danger] = "No se encontraron registros"

    end
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
