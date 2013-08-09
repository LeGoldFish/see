--@import see.rt.RuntimeException
--@import see.base.String
--@extends see.rt.RuntimeException

function InvalidArgumentException:init(n, expected, got)
	if not isprimitive(expected) then
		expected = expected.__name
	end
	if not isprimitive(got) then
		got = got:getName()
	end

	RuntimeException.init(self, String.new("Invalid argument #", n, ". Expected ", expected, ", got ", got, "."))
end