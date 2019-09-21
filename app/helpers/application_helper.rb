module ApplicationHelper
	def text_br(text)
	  h(text).gsub(/\R/, "<br />").html_safe
	end
end
