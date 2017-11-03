class HomeController < ApplicationController
  layout :resolve_layout

  def index
    dba_oldd = request.params
    dba_aprob = 1
    resolve_log(dba_oldd,nil,session[:user],dba_aprob,nil)

    if params[:search] and params[:per]
      if (params[:search] != "" and params[:search] != nil) and (params[:per] != "" and params[:per] != nil)

        if params[:per] == "persona"
          @array = []
          result = GnTerc.find_by(ter_iden: params[:search])
            if !result
              @array << ["Resultado: ","No se encontraron resultados"]
            else
              @array << ["Documento de Identidad",result.ter_iden]
              @array << ["Apellidos",("#{result.ter_pape} #{result.ter_sape}").titleize]
              @array << ["Nombre(s)",("#{result.ter_pnom} #{result.ter_snom}").titleize]
              if result.ter_acti == true
                button = "<a class='btn btn-success btn-xs'> Activo</a>"
              else
                button = "<a class='btn btn-success btn-xs'> Activo</a>"

              end
              @array << ["Estado", button]
            end

        elsif params[:per] == "registro"
          @arrayl = []
          array = []
          result = RePrue.where("pru_desc LIKE ?","%#{params[:search]}%")
            if result.count == 0
              array << ["Resultado: ","No se encontraron resultados"]
              @arrayl << array

            else
              result.each do |row|
                array << ["Descripción",row.pru_desc]
                array << ["Fecha",row.pru_date]
              end
              @arrayl << array

            end
        end
      end
    end
    respond_to do |r|
      r.html
    end
  end

end
