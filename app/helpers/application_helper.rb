module ApplicationHelper
	def active_class(path)
	  request.path.match(path) ? 'active' : 'remove_active'
	end
end
