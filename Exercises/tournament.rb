=begin
  Tournament exercise from exercism.org
  Expected input: A list of teams and results separated by semicolons
    team1;team2;result
  Expected output: A string representing a table tallying the points of each team.
    Results are to be sorted first by point value, then by team name
=end

class Tournament
  def self.tally(input=nil)
    table =["#{"Team".center(31)}| MP |  W |  D |  L |  P"]
    teams = {}
    if input
      input = input.split("\n")
      # Go through each result, starting with splitting each line into team1, team2, result
      for i in input
        info = i.split(";")
        # Check and see if either team is in the teams hash already
        for n in 0..1
          if !teams[info[n]]
            teams[info[n]] = [0, 0, 0, 0, 0]
          end
        end
        # Regardless of result, both teams played
        teams[info[0]][0] += 1
        teams[info[1]][0] += 1
        # If the first team one
        if info[2] == "win"
          teams[info[0]][1] += 1
          teams[info[0]][4] += 3
          teams[info[1]][3] += 1
        # If the first team lost
        elsif info[2] == "loss"
          teams[info[1]][1] += 1
          teams[info[1]][4] += 3
          teams[info[0]][3] += 1
        # If both teams tied
        else
          teams[info[0]][2] += 1
          teams[info[0]][4] += 1
          teams[info[1]][2] += 1
          teams[info[1]][4] += 1
        end
      end
    end
    ##
    # This is a strange interaction, so I want to break it down to remember later
    # teams.sory_by sorts a hash based on certain criteria
    # {|k, v| conditions} creates an ordered list of [k, v] pairs
    # {|k, v| [c1, c2]} sorts the hash first by c1, then by c2
    # Finally, .to_h casts the result as a hash
    teams = teams.sort_by {|k, v| [-v[4], k]}.to_h
    # Run through each key in the sorted hash and add to the table
    for k in teams.each_key
      lst = teams[k]
      # Format the string to add to the table
      table.append("#{k.ljust(31)}|  #{lst[0]} |  #{lst[1]} |  #{lst[2]} |  #{lst[3]} |#{lst[4].to_s.rjust(3)}")
    end

    out = ""
    for l in table
      out += l + "\n"
    end
    return out
  end
end