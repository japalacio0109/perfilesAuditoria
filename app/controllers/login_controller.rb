class LoginController < ApplicationController
  layout false
  def index
    if session[:user]
      redirect_to home_url
    end
    dba_aprob = 1
    resolve_log(nil,nil,session[:user],dba_aprob,nil)
  end

  def auth

    dba_aprob = 1

    if busq = GnTerc.find_by(ter_usua: form_params[:user])
      ter_cont = busq.ter_cont
      if busq.ter_acti == true
        if busq.ter_pass == Digest::SHA1.hexdigest(form_params[:pass])

          busq.ter_onli = 1
          busq.ter_inte = 0
          busq.save
          session[:user] = form_params[:user]
          flash[:success] = "Bienvenido, #{busq.ter_usua}"
          dba_aprob = 1
          routing = home_url
        else
          if busq.ter_inte == 2
            busq.ter_acti = 0
            busq.save
            flash[:warning] = "Excedió el límite de intentos de inicio de sesión"
            dba_aprob = 0
            routing = login_url

          else
            busq.ter_inte = busq.ter_inte + 1
            busq.save
            flash[:danger] = "Usuario y/o contraseña incorrectos"
            dba_aprob = 0
            routing = login_url
          end
        end
      else
        flash[:danger] = "Usuario Inhabilitado, consulte al administrador"
        tipo = "danger"
        dba_aprob = 0
        routing = login_url
      end
    else
      flash[:danger] = "El usuario no se encuentra registrado"
      routing = login_url
      ter_cont = nil
      dba_aprob = 0
    end

    resolve_log("Iniciar sesión",nil,ter_cont,dba_aprob,3)
    redirect_to routing
  end

  def logout
    busq = GnTerc.find_by(ter_usua: session[:user])
    ter_cont = busq.ter_cont
    busq.ter_onli = 0
    busq.save
    dba_aprob = 1
    resolve_log("Cerrar sesión",nil,ter_cont,dba_aprob,5)
    session.delete(:user)
    redirect_to login_url
  end


  protected

  def form_params
    params.permit(:user,:pass)
  end
end
