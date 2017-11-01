class GnTusuController < ApplicationController
  def index
    @t_result = GnTusu.all
  end

  def save
    if form_params[:tus_cont] == "" or form_params[:tus_cont] == nil
      nuevo = GnTusu.new
      ultimo = GnTusu.all.last
      if ultimo == nil
        ultimo = 1
      else
        ultimo = ultimo.tus_cont + 1
      end

      nuevo.tus_cont = ultimo
    else
      nuevo = GnTusu.find_by(tus_cont: form_params[:tus_cont])
    end

    nuevo.tus_desc = form_params[:tus_desc]
    if nuevo.save
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
