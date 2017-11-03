class GnTercController < ApplicationController
  before_action :profile, :administrador
  layout :resolve_layout

  def index
    @t_result = GnTerc.all
  end

  def new
    @nuevo = GnTerc.new
    @f_tdoc = GnTdoc.all
    @f_tusu = GnTusu.all
  end

  def edit
    @nuevo = GnTerc.find_by(ter_cont: params[:id])
    @f_tdoc = GnTdoc.all
    @f_tusu = GnTusu.all
  end

  def show
    @nuevo = GnTerc.find_by(ter_cont: params[:id])
  end

  # def disable
  #   busq = GnTerc.find_by(ter_usua: show_params[:id])
  #   busq.ter_acti = 0;
  #   if busq.save
  #     mensaje = "Ha superado el número máximo de intentos (3) y su usuario ha sido inhabilitado"
  #     tipo = "danger"
  #   else
  #     mensaje = "Problema al momento de inhabilitar"
  #     tipo = "warning"
  #   end
  #   response json: {mensaje: mensaje, tipo: tipo}
  # end

  def save
    if form_params[:ter_cont] == "" or form_params[:ter_cont] == nil
      oldd = nil
      nuevo = GnTerc.new
      ultimo = GnTerc.all.last
      if ultimo == nil
        ultimo = 1
      else
        ultimo = ultimo.ter_cont + 1
      end

      nuevo.ter_cont = ultimo
      dba_dpro = 3
    else
      oldd = GnTerc.find_by(ter_cont: form_params[:ter_cont]).as_json
      nuevo = GnTerc.find_by(ter_cont: form_params[:ter_cont])
      dba_dpro = 4

    end

    nuevo.tdo_cont = form_params[:tdo_cont]
    nuevo.ter_iden = form_params[:ter_iden]
    nuevo.ter_pnom = form_params[:ter_pnom]
    nuevo.ter_snom = form_params[:ter_snom]
    nuevo.ter_pape = form_params[:ter_pape]
    nuevo.ter_sape = form_params[:ter_sape]
    nuevo.ter_usua = form_params[:ter_usua]
    nuevo.ter_pass =  Digest::SHA1.hexdigest(form_params[:ter_pass])
    nuevo.tus_cont = form_params[:tus_cont]
    nuevo.ter_acti = form_params[:ter_acti]
    nuevo.ter_onli = 0
    if nuevo.save
      dba_aprob = 1
      resolve_log(nuevo.as_json,oldd,session[:user],dba_aprob,dba_dpro)
      flash[:success] = "Acción exitosa"
    else
      flash[:danger] = "Error, intente de nuevo mas tarde"
    end
    redirect_to tercindex_url
  end

  def delete
    if GnTerc.where(ter_cont: show_params[:id]).delete_all
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
    params.permit(:ter_cont,:tdo_cont,:ter_iden,:ter_pnom,:ter_snom,:ter_pape,:ter_sape,:ter_usua,:ter_pass,:ter_acti,:tus_cont,:ter_onli)
  end

  def show_params
    params.require(:form).permit(:id)
  end

end
