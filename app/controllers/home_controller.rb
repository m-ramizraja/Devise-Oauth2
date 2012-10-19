require 'rubygems'
require 'mechanize'
class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:google_scrap, :twitter_scrap]

  def index

  end

  def google_scrap

    agent = Mechanize.new

    #page = agent.get("http://localhost:3000/users/sign_in")
    page = agent.get("http://mysterious-scrubland-7912.herokuapp.com/users/sign_in")
    page = agent.click(page.link_with(:text => "Sign in with Google Oauth2"))

    form = page.forms.first
    form['Email'] = "ramiz.raja@tkxel.com"
    form['Passwd'] = "ramiz123$_"
    page = form.submit
    form = page.forms.first
    btn = form.button_with(:name =>"true")
    @page = form.submit(btn)

  end

  def twitter_scrap
    agent = Mechanize.new

    #page = agent.get("http://localhost:3000/users/sign_in")
    page = agent.get("http://mysterious-scrubland-7912.herokuapp.com/users/sign_in")
    page = agent.click(page.link_with(:text => "Sign in with Twitter"))
    form = page.forms.first
    form['session[username_or_email]'] = "ramizraja97 "
    form['session[password]'] = "!2jukjoy"
    page = form.submit

    @page = agent.click(page.link_with(:text => "click here to continue"))

  end
end
