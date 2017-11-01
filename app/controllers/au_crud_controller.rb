class AuCrudController < ApplicationController
  layout :admin
  before_action :profile

  def index
    @t_result = AuCrud.all
  end

  def save
    if form_params[:cru_cont] == "" or form_params[:cru_cont] == nil
      nuevo = AuCrud.new
      ultimo = AuCrud.all.last
      if ultimo == nil
        ultimo = 1
      else
        ultimo = ultimo.cru_cont + 1
      end

      nuevo.cru_cont = ultimo
    else
      nuevo = AuCrud.find_by(cru_cont: form_params[:cru_cont])
    end

    nuevo.cru_desc = form_params[:cru_desc]
    if nuevo.save
      flash[:success] = "Acción exitosa"
    else
      flash[:danger] = "Error, intente de nuevo mas tarde"
    end
    redirect_to crudindex_url
  end

  def show
    busq = AuCrud.find_by(cru_cont: show_params[:id])
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
