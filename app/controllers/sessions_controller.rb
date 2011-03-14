# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem
  skip_before_filter :login_required,:except=>[:home]

  # render new.erb.html
  def new
  end

  def home
    @promocoes = Promocao.find_all_by_ativo(true).collect{|promocao| [promocao.titulo,promocao.id]}
  end


  def create
    logout_keeping_session!
    user = User.authenticate(params[:login], params[:password])
    if user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      redirect_back_or_default('/')
      flash[:notice] = "Seja bem-vindo #{user.login}"
    else
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "Você saiu do sistema!"
    redirect_back_or_default('/')
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Você não pode logar como '#{params[:login]}'"
    logger.warn "FALHA DE LOGIN PARA '#{params[:login]}' DE: #{request.remote_ip} EM: #{Time.now.utc}"
  end
end
