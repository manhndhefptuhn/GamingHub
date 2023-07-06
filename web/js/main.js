'use strict';

(function ($) {

    /*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");

        /*------------------
            Product filter
        --------------------*/
        $('.filter__controls li').on('click', function () {
            $('.filter__controls li').removeClass('active');
            $(this).addClass('active');
        });
        if ($('.property__gallery').length > 0) {
            var containerEl = document.querySelector('.property__gallery');
            var mixer = mixitup(containerEl);
        }
    });

    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    //Search Switch
    $('.search-switch').on('click', function () {
        $('.search-model').fadeIn(400);
    });

    $('.search-close-switch').on('click', function () {
        $('.search-model').fadeOut(400, function () {
            $('#search-input').val('');
        });
    });

    //Canvas Menu
    $(".canvas__open").on('click', function () {
        $(".offcanvas-menu-wrapper").addClass("active");
        $(".offcanvas-menu-overlay").addClass("active");
    });

    $(".offcanvas-menu-overlay, .offcanvas__close").on('click', function () {
        $(".offcanvas-menu-wrapper").removeClass("active");
        $(".offcanvas-menu-overlay").removeClass("active");
    });

    /*------------------
		Navigation
	--------------------*/
    $(".header__menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*------------------
        Accordin Active
    --------------------*/
    $('.collapse').on('shown.bs.collapse', function () {
        $(this).prev().addClass('active');
    });

    $('.collapse').on('hidden.bs.collapse', function () {
        $(this).prev().removeClass('active');
    });

    /*--------------------------
        Banner Slider
    ----------------------------*/
    $(".banner__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*--------------------------
        Product Details Slider
    ----------------------------*/
    $(".product__details__pic__slider").owlCarousel({
        loop: false,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        navText: ["<i class='arrow_carrot-left'></i>","<i class='arrow_carrot-right'></i>"],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: false,
        mouseDrag: false,
        startPosition: 'URLHash'
    }).on('changed.owl.carousel', function(event) {
        var indexNum = event.item.index + 1;
        product_thumbs(indexNum);
    });

    function product_thumbs (num) {
        var thumbs = document.querySelectorAll('.product__thumb a');
        thumbs.forEach(function (e) {
            e.classList.remove("active");
            if(e.hash.split("-")[1] == num) {
                e.classList.add("active");
            }
        })
    }


    /*------------------
		Magnific
    --------------------*/
    $('.image-popup').magnificPopup({
        type: 'image'
    });


    $(".nice-scroll").niceScroll({
        cursorborder:"",
        cursorcolor:"#dddddd",
        boxzoom:false,
        cursorwidth: 5,
        background: 'rgba(0, 0, 0, 0.2)',
        cursorborderradius:50,
        horizrailenabled: false
    });

    /*------------------
        CountDown
    --------------------*/
    // For demo preview start
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    if(mm == 12) {
        mm = '01';
        yyyy = yyyy + 1;
    } else {
        mm = parseInt(mm) + 1;
        mm = String(mm).padStart(2, '0');
    }
    var timerdate = mm + '/' + dd + '/' + yyyy;
    // For demo preview end


    // Uncomment below and use your date //

    /* var timerdate = "2020/12/30" */

	$("#countdown-time").countdown(timerdate, function(event) {
        $(this).html(event.strftime("<div class='countdown__item'><span>%D</span> <p>Day</p> </div>" + "<div class='countdown__item'><span>%H</span> <p>Hour</p> </div>" + "<div class='countdown__item'><span>%M</span> <p>Min</p> </div>" + "<div class='countdown__item'><span>%S</span> <p>Sec</p> </div>"));
    });

    /*-------------------
		Range Slider
	--------------------- */
	var rangeSlider = $(".price-range"),
    minamount = $("#minamount"),
    maxamount = $("#maxamount"),
    minPrice = rangeSlider.data('min'),
    maxPrice = rangeSlider.data('max');
    rangeSlider.slider({
    range: true,
    min: minPrice,
    max: maxPrice,
    values: [minPrice, maxPrice],
    slide: function (event, ui) {
        minamount.val('$' + ui.values[0]);
        maxamount.val('$' + ui.values[1]);
        }
    });
    minamount.val('$' + rangeSlider.slider("values", 0));
    maxamount.val('$' + rangeSlider.slider("values", 1));

    /*------------------
		Single Product
	--------------------*/
	$('.product__thumb .pt').on('click', function(){
		var imgurl = $(this).data('imgbigurl');
		var bigImg = $('.product__big__img').attr('src');
		if(imgurl != bigImg) {
			$('.product__big__img').attr({src: imgurl});
		}
    });
    
    /*-------------------
		Quantity change
	--------------------- */
var proQty = $('.pro-qty');
proQty.each(function () {
  var $qtySelector = $(this).find('input');
  var productId = $qtySelector.data('product-id'); // Assumes you have added a data attribute with the product ID to the input element

  // Get the maximum quantity for the product from the store
  var maxQuantity = parseInt($('#max-quantity-' + productId).val());

  // Get the current quantity of the product in the cart
  var currentQuantity = parseInt($qtySelector.val());

  // Set the initial quantity to the current quantity in the cart
  $qtySelector.val(currentQuantity);

  $qtySelector.on('change', function () {
    var currentValue = parseInt($(this).val());
    if (isNaN(currentValue) || currentValue < 1) {
      $(this).val(1);
    } else if (currentValue > maxQuantity) {
      $(this).val(maxQuantity);
    }
  });
});

proQty.prepend('<span class="dec qtybtn">-</span>');
proQty.append('<span class="inc qtybtn">+</span>');

proQty.on('click', '.qtybtn', function () {
  var $button = $(this);
  var $qtySelector = $button.parent().find('input');
  var oldValue = parseInt($qtySelector.val());
  var productId = $qtySelector.data('product-id'); // Assumes you have added a data attribute with the product ID to the input element

  // Get the maximum quantity for the product from the store
  var maxQuantity = parseInt($('#max-quantity-' + productId).val());

  if ($button.hasClass('inc')) {
    var newVal = oldValue + 1;
    if (newVal > maxQuantity) {
      newVal = maxQuantity;
    }
  } else {
    var newVal = oldValue - 1;
    if (newVal < 1) {
      newVal = 1;
    }
  }

  $qtySelector.val(newVal);
});

//    var proQty = $('.pro-qty');
//	proQty.prepend('<span class="dec qtybtn">-</span>');
//	proQty.append('<span class="inc qtybtn">+</span>');
//	proQty.on('click', '.qtybtn', function () {
//		var $button = $(this);
//		var oldValue = $button.parent().find('input').val();
//		if ($button.hasClass('inc')) {
//			var newVal = parseFloat(oldValue) + 1;
//		} else {
//			// Don't allow decrementing below zero
//			if (oldValue > 0) {
//				var newVal = parseFloat(oldValue) - 1;
//			} else {
//				newVal = 0;
//			}
//		}
//		$button.parent().find('input').val(newVal);
//    });
    
    /*-------------------
		Radio Btn
	--------------------- */
    $(".size__btn label").on('click', function () {
        $(".size__btn label").removeClass('active');
        $(this).addClass('active');
    });

})(jQuery);

/* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */
document.getElementById("drop").addEventListener("click", function(e) {
    document.getElementById("myDropdown").classList.toggle("show");
});


// Close the dropdown if the user clicks outside of it
window.addEventListener("click", function(event) {
    if (!event.target.matches('.dropbtn')) {
        document.querySelectorAll(".dropdown-content.show")
            .forEach(openDropdown => openDropdown.classList.remove('show'))
    }
});


// JavaScript to handle the toast notification display and timeout
window.onload = function() {
    var toast = document.getElementById('toast');
    toast.style.opacity = '1';

    // Set the notification duration (in milliseconds)
    var duration = 5000;

    // Start the progress bar animation
    var progressBar = document.getElementById('toast-progress-bar');
    progressBar.style.width = '100%';
    progressBar.style.transition = 'width ' + (duration / 1000) + 's linear';

    // Hide the toast after the duration
    setTimeout(function() {
        hideToast();
    }, duration);
}

function hideToast() {
    var toast = document.getElementById('toast');
    toast.style.opacity = '0';

    // After fading out, hide the toast
    setTimeout(function() {
        toast.style.display = 'none';
    }, 500);
}

function closeToast() {
    hideToast();
}

