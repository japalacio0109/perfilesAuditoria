class LoginController < ApplicationController
  layout false
  def index
  end

  def auth
    if busq = GnTerc.find_by(ter_usua: form_params[:user])
      if busq.ter_acti == true
        if busq.ter_pass == Digest::SHA1.hexdigest(form_params[:pass])

          busq.ter_onli = 1
          busq.ter_inte = 0
          busq.save
          session[:user] = form_params[:user]
          flash[:success] = "Bienvenido, #{busq.ter_usua}"

        else
          if busq.ter_inte == 2
            busq.ter_acti = 0
            busq.save
            flash[:warning] = "Excedió el límite de intentos de inicio de sesión"
          else
            busq.ter_inte = busq.ter_inte + 1
            busq.save
            flash[:danger] = "Usuario y/o contraseña incorrectos"
          end
        end
      else
        flash[:danger] = "Usuario Inhabilitado, consulte al administrador"
        tipo = "danger"
      end
    else
      flash[:danger] = "El usuario no se encuentra registrado"
    end
    redirect_to login_url
  end

  def logout
    session.delete(:user)
    redirect_to login_url
  end


  protected

  def form_params
    busq = GnTerc.find_by(ter_usua: session[:user])
    busq.ter_onli = 0
    busq.save
    params.permit(:user,:pass)
  end
end
