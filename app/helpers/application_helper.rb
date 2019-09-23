module ApplicationHelper
	def text_br(text)
	  h(text).gsub(/\R/, "<br />").html_safe
	end

	def telephone_ber(telephone_number)
	  if telephone_number.length >= 11
	  	telephone_number.insert(3, '-').insert(8, '-')
	  elsif telephone_number[0..3] == "0120"
	  	telephone_number.insert(4, '-').insert(8, '-')
	  else
	  	telephone_number.insert(3, '-').insert(7, '-')
	  end
	end
end
