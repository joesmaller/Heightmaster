-- State Middleware
-- Joe (ITBV)
-- December 31, 2019



return {
	function(nextDispatch, store)
		return function(action)
			return nextDispatch(action)
		end
	end;
}