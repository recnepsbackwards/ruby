def cannotBeSame (uID, pass)
  if uID == pass
    puts "User ID cannot be the same as your password."
  end
end

def longEnough (uID, pass)
  if uID.length < 6 || pass.length < 6
    puts "User ID and password must be six or more characters."
  end
end

def passContainSymbol (pass)
  if !(pass.include?("!") || pass.include?("#") || pass.include?("$"))
    puts "Invalid"
  end
end

def userCannotContainSymbol(uID)

end

def passwordChecker (uId, pass)

  cannotBeSame(uId, pass)

end
