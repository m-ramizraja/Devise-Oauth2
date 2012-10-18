require 'rubygems'
require 'mechanize'
class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :scraped_data

  def index

  end

  def scraped_data

    agent = Mechanize.new

    page = agent.get("http://localhost:3000/users/sign_in")
    page = agent.click(page.link_with(:text => "Sign in with Google Oauth2"))

    agent.get("https://login.yahoo.com/")
    #form = page.form_with :id => "gaia_loginform"
    form = page.forms.first
    #binding.pry
    form['Email'] = "ramiz.raja@tkxel.com"
    form['Passwd'] = "ramiz123$_"
    #binding.pry
    page = form.submit
    binding.pry
    form = page.forms.first
    btn = form.button_with(:name =>"true")
    form.submit(btn)
  end
end
