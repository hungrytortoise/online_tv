;(function () {
	
	'use strict';

	// iPad and iPod detection	
	var isiPad = function(){
		return (navigator.platform.indexOf("iPad") != -1);
	};

	var isiPhone = function(){
	    return (
			(navigator.platform.indexOf("iPhone") != -1) || 
			(navigator.platform.indexOf("iPod") != -1)
	    );
	};

	// Burger Menu
	var burgerMenu = function() {
		$('body').on('click', '.js-lingfei-nav-toggle', function(){
			if ( $('#lingfei-navbar').is(':visible') ) {
				$(this).removeClass('active');	
			} else {
				$(this).addClass('active');	
			}
			
		});
	};

	var owlCrouselFeatureSlide = function() {
		
		var owl = $('.owl-carousel');

		owl.on('initialized.owl.carousel change.owl.carousel',function(elem){
			var current = elem.item.index;
			$(elem.target).find(".owl-item").eq(current).find(".to-animate").removeClass('fadeInUp animated');
		});
		owl.on('initialized.owl.carousel changed.owl.carousel',function(elem){
			window.setTimeout(function(){
				var current = elem.item.index;
				$(elem.target).find(".owl-item").eq(current).find(".to-animate").addClass('fadeInUp animated');
			}, 400);
     	});

		owl.owlCarousel({
			items: 1,
		    loop: true,
		    margin: 0,
		    responsiveClass: true,
		    nav: true,
		    dots: true,
		    smartSpeed: 500,
		    autoplay: false,
			autoplayTimeout: 5000,
			autoplayHoverPause: true,
		    navText: [	
		      "<i class='icon-arrow-left2 owl-direction'></i>",
		      "<i class='icon-arrow-right2 owl-direction'></i>"
	     	],

		});
		
	};


	// Magnific Popup
	// MagnificPopup
	// var magnifPopup = function() {
	// 	$('.image-popup').magnificPopup({
	// 		type: 'image',
	// 		removalDelay: 300,
	// 		mainClass: 'mfp-with-zoom',
	// 		gallery:{
	// 			enabled:true
	// 		},
	// 		zoom: {
	// 			enabled: true, // By default it's false, so don't forget to enable it
    //
	// 			duration: 300, // duration of the effect, in milliseconds
	// 			easing: 'ease-in-out', // CSS transition easing function
    //
	// 			// The "opener" function should return the element from which popup will be zoomed in
	// 			// and to which popup will be scaled down
	// 			// By defailt it looks for an image tag:
	// 			opener: function(openerElement) {
	// 			// openerElement is the element on which popup was initialized, in this case its <a> tag
	// 			// you don't need to add "opener" option if this code matches your needs, it's defailt one.
	// 			return openerElement.is('img') ? openerElement : openerElement.find('img');
	// 			}
	// 		}
	// 	});
	// };


	// Animate Feature
	var animateFeatureIcons = function() {
		if ( $('#lingfei-features').length > 0 ) {	
			$('#lingfei-features .to-animate').each(function( k ) {
				
				var el = $(this);
				
				setTimeout ( function () {
					el.addClass('bounceIn animated');
				},  k * 200, 'easeInOutExpo' );
				
			});
		}
	};

	// Animate Products
	var animateProducts = function() {
		if ( $('#lingfei-products').length > 0 ) {	
			$('#lingfei-products .to-animate').each(function( k ) {
				
				var el = $(this);
				
				setTimeout ( function () {
					el.addClass('bounceIn animated');
				},  k * 200, 'easeInOutExpo' );
				
			});
		}
	};

	// Animate Clients Logo
	var animateClientLogo = function() {
		if ( $('#lingfei-clients').length > 0 ) {	
			$('#lingfei-clients .to-animate').each(function( k ) {
				
				var el = $(this);
				
				setTimeout ( function () {
					el.addClass('bounceIn animated');
				},  k * 200, 'easeInOutExpo' );
				
			});
		}
	};


	// Waypoints 
	var featureIconsWayPoint = function() {
		if ( $('#lingfei-features').length > 0 ) {
			$('#lingfei-features').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
					
					

					setTimeout(animateFeatureIcons, 200);
					
					
					$(this).addClass('animated');
						
				}
			} , { offset: '80%' } );
		}
	};
	var productsWayPoint = function() {
		if ( $('#lingfei-products').length > 0 ) {
			$('#lingfei-products').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
					
					

					setTimeout(animateProducts, 200);
					
					
					$(this).addClass('animated');
						
				}
			} , { offset: '80%' } );
		}
	};

	var clientsWayPoint = function() {
		if ( $('#lingfei-products').length > 0 ) {
			$('#lingfei-products').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
					
					

					setTimeout(animateClientLogo, 200);
					
					
					$(this).addClass('animated');
						
				}
			} , { offset: '80%' } );
		}
	};
	
	$(function(){
		burgerMenu();
		owlCrouselFeatureSlide();
		// magnifPopup();

		featureIconsWayPoint();
		productsWayPoint();
		clientsWayPoint();



	});


}());