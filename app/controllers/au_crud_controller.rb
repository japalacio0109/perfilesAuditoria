class AuCrudController < ApplicationController
  before_action :profile, :administrador
  layout :resolve_layout

  def index
    @t_result = AuCrud.all
  end

  def save
    if form_params[:cru_cont] == "" or form_params[:cru_cont] == nil
      oldd = nil
      nuevo = AuCrud.new
      ultimo = AuCrud.all.last
      if ultimo == nil
        ultimo = 1
      else
        ultimo = ultimo.cru_cont + 1
      end

      nuevo.cru_cont = ultimo
      dba_dpro = 3
    else
      oldd = AuCrud.find_by(cru_cont: form_params[:cru_cont]).as_json
      nuevo = AuCrud.find_by(cru_cont: form_params[:cru_cont])
      dba_dpro = 4
    end

    nuevo.cru_desc = form_params[:cru_desc]
    if nuevo.save
      dba_aprob = 1
      resolve_log(nuevo.as_json,oldd,session[:user],dba_aprob,dba_dpro)
      flash[:success] = "Acción exitosa"
    else
      flash[:danger] = "Error, intente de nuevo mas tarde"
    end
    redirect_to crudindex_url
  end

  def show
    busq = AuCrud.find_by(cru_cont: show_params[:id])
    dba_aprob = 1
    resolve_log(nuevo.as_json,oldd.as_json,session[:user],dba_aprob,nil)
    render json: busq
  end

  def delete
    if AuCrud.where(cru_cont: show_params[:id]).delete_all
      mensaje = "Acción Exitosa"
      tipo = "success"
    else
      mensaje = "Intente de nuevo mas tarde"
      tipo = "danger"
    end
    dba_aprob = 1
    resolve_log(nil,nil,session[:user],dba_aprob,5)
    render json: {mensaje: mensaje, tipo: tipo}
  end

  protected

  def form_params
    params.permit(:cru_cont,:cru_desc)
  end

  def show_params
    params.require(:form).permit(:id)
  end

end
