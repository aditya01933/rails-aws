class Ec2Instance < ApplicationRecord
  # Todo: add unique constraint in db
  validates :instance_id, presence: true, uniqueness: true

  def self.sync_instance
    # Instead of creating array, we can create an hash map to speed-up the lookup/delete operation.
    db_instance_ids = Ec2Instance.all.pluck(:instance_id).uniq
    
    aws_instance_ids = []
    $ec2.instances.each do |aws_instance|
      # Only checking for terminated for now. Avoiding other states like shutting-down, stopped etc.
      aws_instance_ids << aws_instance.instance_id if aws_instance.state.name != "terminated"
      # We can also update the other info here if needed.
    end

    destroyed_count = (db_instance_ids - aws_instance_ids).count
    (db_instance_ids - aws_instance_ids).each do |instance|
      # instead of destroying here we can just mark it for deleting and destroy in a background job.
      Ec2Instance.where(instance_id: instance).destroy_all()
    end

    added_count = (aws_instance_ids - db_instance_ids).count
    (aws_instance_ids - db_instance_ids).each do |instance|
      # we can also just update the count and update in background
      Ec2Instance.add_info(instance)
    end

    [added_count, destroyed_count]
  end

  def self.add_info(aws_instance_id)
    Ec2Instance.create!(instance_id: aws_instance_id)
  end
end
