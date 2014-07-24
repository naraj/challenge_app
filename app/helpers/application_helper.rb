module ApplicationHelper
	def flash_class(type)
		
	    case type.to_s
		    when "alert"
		    	"alert-warning"
		    when "notice" 
		    	"alert-info"
		    when "success" 
		    	"alert-success"
		    when "error" 
		    	"alert-danger"
		    else
		    	type.to_s
	   	end
    end
end
