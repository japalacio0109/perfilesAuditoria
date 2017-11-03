class GnTusuController < ApplicationController
  before_action :profile, :administrador
  layout :resolve_layout

  def index
    @t_result = GnTusu.all
  end

  def save
    if form_params[:tus_cont] == "" or form_params[:tus_cont] == nil
      oldd = nil
      nuevo = GnTusu.new
      ultimo = GnTusu.all.last
      if ultimo == nil
        ultimo = 1
      else
        ultimo = ultimo.tus_cont + 1
      end

      nuevo.tus_cont = ultimo
      dba_dpro = 3
    else
      oldd = GnTusu.find_by(tus_cont: form_params[:tus_cont]).as_json
      nuevo = GnTusu.find_by(tus_cont: form_params[:tus_cont])
      dba_dpro = 4

    end

    nuevo.tus_desc = form_params[:tus_desc]
    if nuevo.save
      dba_aprob = 1
      resolve_log(nuevo.as_json,oldd,session[:user],dba_aprob,dba_dpro)
      flash[:success] = "Acción exitosa"
    else
      flash[:danger] = "Error, intente de nuevo mas tarde"
    end
    redirect_to tusuindex_url
  end

  def show
    busq = GnTusu.find_by(tus_cont: show_params[:id])
    render json: busq
  end

  def delete
    if GnTusu.where(tus_cont: show_params[:id]).delete_all
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
    params.permit(:tus_cont,:tus_desc)
  end

  def show_params
    params.require(:form).permit(:id)
  end
end
