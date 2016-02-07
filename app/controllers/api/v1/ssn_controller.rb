require 'date'

class Api::V1::SsnController < ApplicationController
  CENTURY_MAP = {
  	'A': 20,
  	'-': 19,
  	'+': 18
  }

	CHECKSUM_TABLE = '0123456789ABCDEFHJKLMNPRSTUVWXY'

  def validate
  	@errors = []

    unless params['ssn'].nil? or params['ssn'].blank?
    	ssn = params['ssn']

      if ssn.size != 11
      	@errors << 'ssn not 11 digits long.'
      end

  		if !ssn[6].to_sym.in?(CENTURY_MAP)
      	@errors << "Century identification sign wrong (+ for the 19th century, - for the 20th and A for the 21st)."
      end

      birth_date = CENTURY_MAP[ssn[6].to_sym].to_s + ssn[4..5] + '-' + ssn[2..3] + '-' + ssn[0..1]
  		if !birth_date.valid_date?
      	@errors << 'Invalid birth date' 
      end

  		birth_date_obj = Date.parse(birth_date) rescue Date.today
      validation_date = Date.today

  		if birth_date_obj >= validation_date
  			@errors << "Birth date is greater than or equal to today's date."
  		end

      sum = (ssn[0..5] + ssn[7..9]).to_i

      checksum = CHECKSUM_TABLE[sum % 31]

      if checksum != ssn[-1]
      	@errors << "Checksum wrong."
      end
    
      if @errors.empty?
        render plain: 'true', status: :ok
      else
        render plain: 'false', status: :bad_request
  		end
    else
      render plain: 'false', status: :bad_request
    end

  end
end