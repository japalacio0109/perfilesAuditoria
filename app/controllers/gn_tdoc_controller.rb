class GnTdocController < ApplicationController
  def index
    @t_result = GnTdoc.all
  end

  def save
    if form_params[:tdo_cont] == "" or form_params[:tdo_cont] == nil
      nuevo = GnTdoc.new
      ultimo = GnTdoc.all.last
      if ultimo == nil
        ultimo = 1
      else
        ultimo = ultimo.tdo_cont + 1
      end

      nuevo.tdo_cont = ultimo
    else
      nuevo = GnTdoc.find_by(tdo_cont: form_params[:tdo_cont])
    end

    nuevo.tdo_desc = form_params[:tdo_desc]
    if nuevo.save
      flash[:success] = "Acción exitosa"
    else
      flash[:danger] = "Error, intente de nuevo mas tarde"
    end
    redirect_to tdocindex_url
  end

  def show
    busq = GnTdoc.find_by(tdo_cont: show_params[:id])
    render json: busq
  end

  def delete
    if GnTdoc.where(tdo_cont: show_params[:id]).delete_all
      mensaje = "Acción Exitosa"
      tipo = "success"
    else
      mensaje = "Intente de nuevo mas tarde"
      tipo = "danger"
    end
    render json: {mensaje: mensaje, tipo: tipo}
  end

  protected

  def form_params
    params.permit(:tdo_cont,:tdo_desc)
  end

  def show_params
    params.require(:form).permit(:id)
  end

end
