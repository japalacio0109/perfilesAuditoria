class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'socket'

  protected

  def profile
    if session[:user]
    else
      dba_aprob = 0
      resolve_log(nil,nil,session[:user],dba_aprob,nil)
      flash[:danger] = "Inicie sesión para continuar"
      redirect_to login_url
    end
  end

  def auditor
    busq = find_user
    if busq.tus_cont == 2
      dba_aprob = 1
      resolve_log(nil,nil,session[:user],dba_aprob,nil)
    else
      dba_aprob = 0
      resolve_log(nil,nil,session[:user],dba_aprob,nil)
      redirect_home
    end
  end

  def administrador
    busq = find_user
    if busq.tus_cont == 1
      dba_aprob = 1
      resolve_log(nil,nil,session[:user],dba_aprob,nil)
    else
      dba_aprob = 0
      resolve_log(nil,nil,session[:user],dba_aprob,nil)
      redirect_home
    end
  end

  def usuario
    busq = find_user
    p cru_cont
    if busq.tus_cont == 3
      dba_aprob = 1
      resolve_log(nil,nil,session[:user],dba_aprob,nil)
    else
      dba_aprob = 0
      resolve_log(nil,nil,session[:user],dba_aprob,nil)
      redirect_home
    end
  end

  def resolve_layout
    busq = find_user

    if !session[:user]
      "application"
    else
      case busq.tus_cont
      when 1
        "admin"
      when 2
        "auditor"
      when 3
        "default"
      else
        "application"
      end
    end

  end

  def resolve_log(dba_newd,dba_oldd,ter_cont,dba_aprob,dba_dpro)
    nuevo = AuDbau.new
    ultimo = AuDbau.all.last
    if ultimo == nil
      ultimo = 1
    else
      ultimo = ultimo.dba_cont + 1
    end
    nuevo.dba_rout = request.path_info
    nuevo.dba_cont = ultimo
    nuevo.dba_newd = dba_newd
    nuevo.dba_urlp = request.params
    nuevo.dba_oldd = dba_oldd
    cru_cont = AuCrud.find_by(cru_desc: request.method.downcase).cru_cont
    if dba_dpro == nil
      dba_dpro = 6
    end
    nuevo.dba_dpro = dba_dpro
    nuevo.cru_cont = cru_cont
    nuevo.dba_client = Socket.gethostname
    nuevo.dba_ip = request.remote_ip
    if session[:user]
      nuevo.ter_cont = GnTerc.find_by(ter_usua: session[:user]).ter_cont
    elsif ter_cont != nil and ter_cont != ""
      nuevo.ter_cont = ter_cont
    else
      nuevo.ter_cont = nil
    end
    nuevo.dba_aprob = dba_aprob
    nuevo.save
  end

  def find_user
    GnTerc.find_by(ter_usua: session[:user])
  end

  def redirect_home
    flash[:danger] = "No tiene permisos para este módulo"
    redirect_to home_url
  end
end
