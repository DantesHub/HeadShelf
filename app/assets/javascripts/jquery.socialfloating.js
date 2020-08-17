(function ($) {
  "use strict";

  $.socialfloating = function (options) {
    var defaults = {
      theme: "light",
      opaque: false,
      effect: null,
      icons: "fontawesome5",
      showHideButton: true,
      container: "socialfloating",
      position: "left",
      buttons: {}
    };

    var settings = $.extend({}, defaults, options);
   var title = $('#js-title').text()
    console.log("bing")
   console.log(title);
    var container = $("#" + settings.container);

    if (container.length === 0) {
      $("body").append(
        '<div id="' +
          settings.container +
          '" class="contact-bar ' +
          settings.position +
          '">'
      );

      container = $("#" + settings.container);
      container.addClass(settings.effect);

      if (settings.showHideButton === true) {
        var sShowHideButton;
        switch (settings.position) {
          case "right":
            sShowHideButton =
              '<a class="cb-link toggle-bar"><span class="fa fa-angle-right" aria-hidden="true"></span></a>';
            break;
          default:
            sShowHideButton =
              '<a class="cb-link toggle-bar"><span class="fa fa-angle-left" aria-hidden="true"></span></a>';
            break;
        }
        container.append(sShowHideButton);
      }

      addButtons(container, settings.buttons, false, settings.icons);

      setTimeout(function () {
        switch (settings.position) {
          case "right":
            container.animate({ right: 0 });
            break;
          default:
            container.animate({ left: 0 });
            break;
        }
      }, 200);

      $("body").on("click", ".toggle-bar", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        switch (settings.icons) {
          case "fontawesome5":
            $(".toggle-bar")
              .find(".fa")
              .toggleClass("fa-angle-right fa-angle-left");
            container.find(".cb-anchor").toggleClass("cb-hidden");
            break;
          default:
            $(".toggle-bar")
              .find(".fas")
              .toggleClass("fa-angle-right fa-angle-left");
            container.find(".cb-anchor").toggleClass("cb-hidden");
            break;
        }
      });
    }
  };

  function addButtons(container, buttons, group, icons) {
    var i,
      space = "";
    for (i in buttons) {
      if (Array.isArray(buttons[i])) {
        addButtons(container, buttons[i], group, icons);
        group = true;
      } else {
        if (group == true) {
          space = " separated";
          group = false;
        } else {
          space = "";
        }
        var bs = buttons[i];

        if (bs.enabled) {
          var sIcon;
          switch (icons) {
            case "fontawesome5":
              if (bs.icon == "envelope") {
                sIcon =
                  '<span class="fas fa-' +
                  bs.icon +
                  '" aria-hidden="true"></span>';
                break;
              } else {
                sIcon =
                  '<span class="fab fa-' +
                  bs.icon +
                  '" aria-hidden="true"></span>';
                break;
              }

            default:
              sIcon =
                '<span class="fab fa-' +
                bs.icon +
                '" aria-hidden="true"></span>';
              break;
          }
          var button =
            '<a href="' +
            bs.link +
            '" class="cb-link cb-anchor' +
            space +
            '" ' +
            (bs.color ? 'style="background-color: ' + bs.color + '"' : "") +
            (bs.title ? 'title="' + bs.title + '"' : "") +
            (bs.extras ? bs.extras : "") +
            "target = _blank>" +
            sIcon +
            "</a>";
          container.append(button);
        }
      }
    }
  }

  $(function () {
    var el = $(".contact-bar.slide-on-scroll");
    el.attr("data-top", el.css("top"));

    $(window).scroll(function () {
      clearTimeout($.data(this, "scrollCheck"));
      $.data(
        this,
        "scrollCheck",
        setTimeout(function () {
          var nTop = $(window).scrollTop() + parseInt(el.attr("data-top"));
          el.animate(
            {
              top: nTop,
            },
            500
          );
        }, 250)
      );
    });
  });
})(jQuery);
