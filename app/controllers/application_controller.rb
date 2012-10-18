class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  #def authenticate_user!

    #agent = Mechanize.new

    #page = agent.get("https://www.elance.com/php/landing/main/login.php")
    #
    #login_form = page.form_with :id => "loginForm"
    #binding.pry
    #login_form['lnm'] = ""
    #login_form['pwd'] = ""
    #
    #@result = agent.submit(login_form)

#page = agent.get("https://www.odesk.com/login.php")
#
#    login_form = page.form_with :id => "login_frm"
#    login_form['login'] = "junaid1234"
#    login_form['password'] = "tkxel1234"
#
#    @result = agent.submit(login_form)

  #end

end
