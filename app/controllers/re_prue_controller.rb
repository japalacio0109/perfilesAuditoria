class RePrueController < ApplicationController
  before_action :profile, :usuario
  layout :resolve_layout

  def index
    @t_result = RePrue.all
  end

  def new
    @nuevo = RePrue.new
  end

  def save
    if form_params[:pru_cont] == "" or form_params[:pru_cont] == nil
      nuevo = RePrue.new
      ultimo = RePrue.all.last
      if ultimo == nil
        ultimo = 1
      else
        ultimo = ultimo.pru_cont + 1
      end

      nuevo.pru_cont = ultimo
      dba_dpro = 3
    else
      oldd = RePrue.find_by(pru_cont: form_params[:pru_cont])
      nuevo = RePrue.find_by(pru_cont: form_params[:pru_cont])
      dba_dpro = 4
    end

    nuevo.pru_desc = form_params[:pru_desc]
    nuevo.pru_date = form_params[:pru_date]
    if nuevo.save
      dba_aprob = 1
      resolve_log(nuevo.as_json,oldd,session[:user],dba_aprob,dba_dpro)
      flash[:success] = "Acción exitosa"
    else
      flash[:danger] = "Error, intente de nuevo mas tarde"
    end
    redirect_to prueindex_url
  end

  def edit
    @nuevo = RePrue.find_by(pru_cont: params[:id])
  end

  def show
    @nuevo = RePrue.find_by(pru_cont: params[:id])
  end

  def delete
    if RePrue.where(pru_cont: show_params[:id]).delete_all
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
    params.permit(:pru_cont,:pru_desc,:pru_date)
  end

  def show_params
    params.require(:form).permit(:id)
  end
end
