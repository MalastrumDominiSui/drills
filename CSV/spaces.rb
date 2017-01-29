def makeSpaceStr (csvStr , spaceNum, aCharStr)
	spaces = spaceNum - csvStr.length 
	spaces1 = aCharStr * spaces 

	return(print csvStr + spaces1)

end

makeSpaceStr ("", 30, "=")