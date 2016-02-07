require "rails_helper"

RSpec.describe Api::V1::SsnController do
  describe "GET valid SSN: 290296-7808" do
    it "has a 200 status code" do
      get '/api/v1/validate_ssn?ssn=290296-7808'
      expect(response.status).to eq(200)
      expect(response.headers).to include("Content-Type" => "text/plain; charset=utf-8")
      expect(response.body).to eq('true')
    end
  end

  describe "GET no SSN param" do
    it "has a 400 status code" do
      get '/api/v1/validate_ssn'
      expect(response.status).to eq(400)
      expect(response.headers).to include("Content-Type" => "text/plain; charset=utf-8")
      expect(response.body).to eq('false')
    end
  end

  describe "GET invalid SSN" do
    it "has a 400 status code" do
    	invalid_ssn = ['', '290295-7808', '290295-78018', '290295-78018', '290296-7809']
      invalid_ssn.each do |ssn|
	      get '/api/v1/validate_ssn?ssn=' + ssn
	      expect(response.status).to eq(400)
	      expect(response.headers).to include("Content-Type" => "text/plain; charset=utf-8")
	      expect(response.body).to eq('false')
	  	end
    end
  end

end