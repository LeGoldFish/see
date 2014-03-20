--@import see.util.Comparator

--@extends see.util.Comparator

function BinaryComparator:init()
	self:super(Comparator).init()
end

function BinaryComparator:compareTo(a, b)
	if a == b then 
		return 0
	elseif a < b then
		return -1
	elseif a > b then
		return 1
	end
end