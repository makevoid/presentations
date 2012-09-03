// Generated by CoffeeScript 1.3.3
(function() {
  var PresentationView, root;

  PresentationView = (function() {

    function PresentationView(options) {
      this.container = options.container;
      this.presentation = options.presentation;
      this.container.append(this.presentation.toDOMTree());
      this.sections = this.container.find('section');
      this.createNavigation();
    }

    PresentationView.prototype.createNavigation = function() {
      var _this = this;
      this.container.append('<nav><a href="#" data-role="previous">Previous</a> | <a href="#" data-role="next">Next</a></nav>');
      this.next().click(function() {
        return _this.advance();
      });
      return this.previous().click(function() {
        return _this.goBack();
      });
    };

    PresentationView.prototype.showSlide = function(number) {
      this.currentSlide = number;
      this.sections.hide();
      this.sections.eq(number).show();
      if (number === 0) {
        this.previous().hide();
      } else {
        this.previous().show();
      }
      if (number === this.sections.length - 1) {
        return this.next().hide();
      } else {
        return this.next().show();
      }
    };

    PresentationView.prototype.previous = function() {
      return this.container.find('a[data-role="previous"]');
    };

    PresentationView.prototype.next = function() {
      return this.container.find('a[data-role="next"]');
    };

    PresentationView.prototype.advance = function() {
      if (this.currentSlide < this.sections.length - 1) {
        return this.showSlide(this.currentSlide + 1);
      }
    };

    PresentationView.prototype.goBack = function() {
      if (this.currentSlide > 0) {
        return this.showSlide(this.currentSlide - 1);
      }
    };

    return PresentationView;

  })();

  root = typeof exports !== "undefined" && exports !== null ? exports : window;

  root.PresentationView = PresentationView;

}).call(this);