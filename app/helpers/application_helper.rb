module ApplicationHelper

def listcondition
	if current_user.id == User.find_by_id(params[:user]).id
		return true
	end
	return false
end

def itemcondition
	@uli = User.find_by_id(List.find_by_id(params[:list_id]).user_id)
  if current_user.id == User.find_by_id(List.find_by_id(params[:list_id]).user_id).id 
  	return true
  elsif current_user.id != @uli.id 
  	return false
	end
end
	
end
