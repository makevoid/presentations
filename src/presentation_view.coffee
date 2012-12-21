class PresentationView

  constructor: (options) ->
    @container = options.container
    @presentation = options.presentation

    @container.append @presentation.toDOMTree()
    @sections = @container.find('section')

    @createNavigation()

  createNavigation: ->
    @container.append '<nav><a href="#" data-role="previous">Previous</a> | <a href="#" data-role="next">Next</a></nav>'
    @next().on      "click", => @advance()
    @previous().on  "click", => @goBack()

  showSlide: (number) ->
    @currentSlide = parseInt(number)
    @sections.hide()
    @sections.eq(number).show()

    if number == 0 then @previous().hide() else @previous().show()
    if number == @sections.length - 1 then @next().hide() else @next().show()

  previous: ->
    @container.find('a[data-role="previous"]')

  next: ->
    @container.find('a[data-role="next"]')

  advance: ->
    slide = @currentSlide + 1
    if @currentSlide < @sections.length - 1
      @pushState slide
      @showSlide slide

  goBack: ->
    slide = @currentSlide - 1
    if @currentSlide > 0
      @pushState slide
      @showSlide slide

  pushState: (slide) ->
    history.pushState { current: slide }, null, "/##{slide}"

  goTo: (slide) ->
    @showSlide slide

  show_linked_slide: ->
    if location.hash[1..-1]
      @showSlide location.hash[1..-1]

root = exports ? window
root.PresentationView = PresentationView
