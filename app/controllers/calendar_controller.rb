class CalendarController < ApplicationController
  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def redirect
  client = Signet::OAuth2::Client.new({
    client_id: ENV.fetch('727945567550-8l8armoaq8ngit07ge25l0m734mctd6k.apps.googleusercontent.com'),
    client_secret: ENV.fetch('cMRQwADD5vew3BjrehmkYNev'),
    authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
    scope: Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY,
    redirect_uri: url_for(:action => :callback)
  })

  redirect_to client.authorization_uri.to_s
  end

end
