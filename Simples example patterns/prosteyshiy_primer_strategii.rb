
class Navigator
	attr_accessor: :route_strategy
	
	def build_route
	end
end

class RouteStrategy
	def build_route
	end
end

class RoadStrategy
	def build_route
		puts 'bibika'
	end
end

class PublicTransport
	def build_route
		puts 'tramvaichick'
	end
end

def main
	obj_navigator = Navigator.new()
	obj_navigator.route_strategy = PublicTransport.new
	obj_navigator.build_route
	obj_navigator.route_strategy = RoadStrategy.new
	obj_navigator.build_route
end