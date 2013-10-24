
CodeMirror.defineMode "cirru", ->

  startState: ->
    head: yes
  token: (stream, state) ->
    console.log stream, state
    if stream.match "$"
      state.head = yes
      "dollar"
    else if stream.match /^[^\$\"\s\(\)][^\"\s\(\)]*/
      if state.head
        state.head = no
        "word-func"
      else
        "word"
    else if stream.match /^"([^\\\"]|(\\.))*\"/
      if state.head
        state.head = no
        "string-func"
      else
        "string"
    else if stream.match "("
      state.head = yes
      "bracket"
    else if stream.match ")"
      state.head = no
      "bracket"
    else if stream.match "\n"
      console.log "start of line"
      state.head = yes
    else # if stream.match " "
      stream.next()
      null
