$ ->

  success = (text) ->
    presentation = new Presentation
      html: markdown.toHTML text
      jquery: $

    $('body').html ''

    view = new PresentationView
      presentation: presentation
      container: $ 'body'

    view.showSlide(0)
    view.show_linked_slide()

    document.onkeydown = (e) ->
      switch e.which
        when 37
          view.goBack()
        when 39
          view.advance()

    window.onpopstate = (event) ->
      view.goTo event.state.current


    $('code').attr 'data-language', 'ruby'
    Rainbow.color()

  pres_loaded = (text) ->
    # console.log text
    names = []
    matches = text.match(/\[ruby:(\w+)\]/g)
    for match, idx in matches
      match = match.match(/\[ruby:(\w+)\]/)[1]
      $.get "/ruby/#{match}.rb", (data) ->
        regex = new RegExp "\\[ruby:#{match}\\]"
        text = text.replace(/\[ruby:enumerable_lazy3\]/, "```#{data}```")

        view.pres_loaded_one matches, idx



  pres_loaded_one = (matches, idx) ->
    success text

  $.ajax '/presentation.mkd',
    success: success
    error: ->
      alert 'error: ' + arguments
