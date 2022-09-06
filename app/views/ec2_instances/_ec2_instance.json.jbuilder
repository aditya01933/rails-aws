json.extract! ec2_instance, :id, :instance_id, :created_at, :updated_at
json.url ec2_instance_url(ec2_instance, format: :json)
