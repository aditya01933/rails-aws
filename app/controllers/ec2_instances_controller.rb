class Ec2InstancesController < ApplicationController
  def sync
    sync_data = Ec2Instance.sync_instance

    render json: {"added": sync_data[0], "deleted": sync_data[1]}
  end
end
