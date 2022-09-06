require "application_system_test_case"

class Ec2InstancesTest < ApplicationSystemTestCase
  setup do
    @ec2_instance = ec2_instances(:one)
  end

  test "visiting the index" do
    visit ec2_instances_url
    assert_selector "h1", text: "Ec2 instances"
  end

  test "should create ec2 instance" do
    visit ec2_instances_url
    click_on "New ec2 instance"

    fill_in "Instance", with: @ec2_instance.instance_id
    click_on "Create Ec2 instance"

    assert_text "Ec2 instance was successfully created"
    click_on "Back"
  end

  test "should update Ec2 instance" do
    visit ec2_instance_url(@ec2_instance)
    click_on "Edit this ec2 instance", match: :first

    fill_in "Instance", with: @ec2_instance.instance_id
    click_on "Update Ec2 instance"

    assert_text "Ec2 instance was successfully updated"
    click_on "Back"
  end

  test "should destroy Ec2 instance" do
    visit ec2_instance_url(@ec2_instance)
    click_on "Destroy this ec2 instance", match: :first

    assert_text "Ec2 instance was successfully destroyed"
  end
end
