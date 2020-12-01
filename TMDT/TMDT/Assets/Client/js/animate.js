

jQuery(document).ready(function($) {

    function elementsAnimate() {
        var windowWidth = window.innerWidth || document.documentElement.clientWidth;
        var animate = $('.animate');
        var animateDelay = $('.animate-delay-outer');
        if (windowWidth > 767) {
            animate.bind('inview', function (event, visible) {
                if (visible && !$(this).hasClass("animated")) {
                    $(this).addClass("animated");
                }
            });
			animateDelay.bind('inview', function (event, visible) {
                if (visible && !$(this).hasClass("animated")) {
                    var j = -1;
                    var $this = $(this).find(".animate-delay");
                    $this.each(function () {
                        var $this = jQuery(this);
                        j++;
                        setTimeout(function () {
                            $this.addClass("animated");
                        }, 200 * j);
                    });
					$(this).addClass("animated");
                }
            });
        }
    }
	// !- Fire animation
	elementsAnimate();
		$(window).on("scroll", function () {
			elementsAnimate();
		});


});