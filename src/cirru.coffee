
module.exports = ->

  startState: ->
    head: yes
  token: (stream, state) ->
    # console.log stream, state
    if stream.sol()
      state.head = yes
    if stream.match "$"
      state.head = yes
      "bracket"
    else if stream.match ','
      state.head = no
      'bracket'
    else if stream.match /^[^\$\"\s\(\)][^\"\s\(\)]*/
      if state.head
        state.head = no
        "keyword"
      else
        "variable"
    else if stream.match /^"([^\\\"]|(\\.))*\"/
      if state.head
        state.head = no
        "keyword"
      else
        "variable"
    else if stream.match "("
      state.head = yes
      "bracket"
    else if stream.match ")"
      state.head = no
      "bracket"
    else # if stream.match " "
      stream.next()
      null
