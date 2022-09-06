class AwsController < ApplicationController
  def sync
    head :ok
  end

  def databases
    Redis.current.ping
    ActiveRecord::Base.connection.execute("SELECT 1")

    head :ok
  end
end
