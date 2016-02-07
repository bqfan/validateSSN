require "rails_helper"

RSpec.describe "routes for validate_ssn", :type => :routing do
  it "routes /api/v1/validate_ssn to the ssn controller" do
    expect(:get => "/api/v1/validate_ssn").
      to route_to(:controller => "api/v1/ssn", :action => "validate")
  end
end