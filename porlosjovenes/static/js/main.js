/**    
 * 
 * ---------------------------------------------------------------------------
 *
 * Template Name: Believed - Nonprofit HTML5 Responsive Template
 * Template URL:	 http://lovesome.biz/believed
 * Author : urosd
 * Version : 1.0 
 *
 * --------------------------------------------------------------------------- 
 *
 */

function slicknavOpened(trigger) {
    var $trigger = $(trigger[0]);
    if ($trigger.hasClass('slicknav_btn')) {
        // this is the top-level menu/list opening.
        // we only want to trap lower-level/sublists.
        return;
    }
    // trigger is an <a> anchor contained in a <li>
    var $liParent = $trigger.parent();
    // parent <li> is contained inside a <ul>
    var $ulParent = $liParent.parent();
    // loop through all children of parent <ul>
    // i.e. all siblings of this <li>
    $ulParent.children().each(function () {
        var $child = $(this);
        if ($child.is($liParent)) {
            // this child is self, not is sibling
            return;
        }
        if ($child.hasClass('slicknav_collapsed')) {
            // this child is already collapsed
            return;
        }
        if (!$child.hasClass('slicknav_open')) {
            // could throw an exception here: this shouldn't happen
            // because I expect li to have class either slicknav_collapsed or slicknav_open
            return;
        }
        // found a sibling <li> which is already open.
        // expect that its first child is an anchor item.
        var $anchor = $child.children().first();
        if (!$anchor.hasClass('slicknav_item')) {
            return;
        }
        // close the sibling by emulating a click on its anchor.
        $anchor.click();
    });
}

(function ($) {
    'use strict';
    /*  ======================================
            Mobile Menu
        ====================================== */
    var mobile_menu = $('ul.navigation');
    mobile_menu.slicknav({
        prependTo: '.responsive-menu-wrap',
       beforeOpen : function(trigger) { slicknavOpened(trigger); }
    });
    /*  =========================
            Fixed Menu
        =========================*/
    $(window).on('scroll', function () {
        if ($(window).scrollTop() > 1) {
            $('.menu-area').addClass('fixed-menu');
            $('.menu-area').removeClass('on-top');

            $('.top-header-area').addClass('fixear');
        } else {
            $('.menu-area').removeClass('fixed-menu');
            $('.menu-area').addClass('on-top');
            $('.top-header-area').removeClass('fixear');
        }
    });
    /*  =========================
            sticky menu
        =========================*/
    $(".menu-area").sticky({
        topSpacing: 0
    });

    /*  =========================
            donate label
        =========================*/
    $('.label-show').on('click', function () {
        $('.from-hidden').addClass('from-show');
    });

    $('.label-hidden').on('click', function () {
        $('.from-hidden').removeClass('from-show');
    });

    /*  ======================================
            Owl Carousel
        ====================================== */
    /*---------- main slider ---------*/
    var slider_pulse = $('.slider-wraper, .client-comment-info');
    slider_pulse.owlCarousel({
        navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
        loop: true,
        nav: true,
        autoplay: false,
        autoplayTimeout: 7000,
        mouseDrag: true,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    });
    // Owl Carousel Animation
    slider_pulse.on('translate.owl.carousel', function () {
        $('.slider-info h2, .slider-info p').removeClass('animated fadeInUp').css('opacity', '0');
        $('.slider-info h3').removeClass('animated fadeInDown').css('opacity', '0');
        $('.slider-info a').removeClass('animated fadeInDown').css('opacity', '0');
    });
    slider_pulse.on('translated.owl.carousel', function () {
        $('.slider-info h2, .slider-info p').addClass('animated fadeInUp').css('opacity', '1');
        $('.slider-info h3').addClass('animated fadeInDown').css('opacity', '1');
        $('.slider-info a').addClass('animated fadeInDown').css('opacity', '1');
    });

    /*---------- blog slider ---------*/
    var blog_slider = $('.blog-slider');
    blog_slider.owlCarousel({
        navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
        loop: true,
        nav: true,
        autoplay: false,
        margin: 10,
        autoplayTimeout: 7000,
        mouseDrag: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            1000: {
                items: 3
            }
        }
    });

    /*---------- upcoming events slider ---------*/
    var events_slider = $('.upcoming-events');
    events_slider.owlCarousel({
        navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
        loop: true,
        nav: true,
        autoplay: true,
        margin: 10,
        autoplayTimeout: 7000,
        mouseDrag: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    });

    /*---------- partners slider ---------*/
    var events_slider = $('.partners-brand');
    events_slider.owlCarousel({
        navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
        loop: true,
        nav: true,
        autoplay: true,
        margin: 10,
        autoplayTimeout: 7000,
        mouseDrag: true,
        responsive: {
            0: {
                items: 2
            },
            600: {
                items: 4
            },
            1000: {
                items: 6
            }
        }
    });


    /*---------- blog slider ---------*/
    var blog_slider = $('.covid-slider');
    blog_slider.owlCarousel({
        navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
        loop: true,
        nav: true,
        autoplay: false,
        margin: 10,
        autoplayTimeout: 7000,
        mouseDrag: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            1000: {
                items: 4
            }
        }
    });

    /*  ======================================
            CounterUp
        ====================================== */
    var progress = $('.counter');
    progress.waypoint(function () {
        var CounterUp = $('.counter');
        CounterUp.each(function () {
            var $this = $(this),
                countTo = $this.attr('data-count');
            $({
                countNum: $this.text()
            }).animate({
                countNum: countTo
            }, {
                duration: 2500,
                easing: 'linear',
                step: function () {
                    $this.text(Math.floor(this.countNum));
                },
                complete: function () {
                    $this.text(this.countNum);
                    //alert('finished');
                }
            });
        });
    }, {
        offset: '100%'
    });

    /*  ======================================
            Barfiller
        ====================================== */
    var progress_bar = $('.barfiller');
    progress_bar.waypoint(function () {
        //Progress Bar
        var progressbarOne = $('#bar1');
        progressbarOne.barfiller();
    }, {
        offset: '100%'
    });

    /*  ======================================
             Scroll Up
         ====================================== */
    $.scrollUp({
        scrollName: 'scrollUp', // Element ID
        topDistance: '300', // Distance from top before showing element (px)
        topSpeed: 300, // Speed back to top (ms)
        animation: 'fade', // Fade, slide, none
        animationInSpeed: 200, // Animation in speed (ms)
        animationOutSpeed: 200, // Animation out speed (ms)
        scrollText: "<a class='hvr-icon-bob click-top'></a>", // Text for element
        activeOverlay: false // Set CSS color to display scrollUp active point, e.g '#00FFFF'
    });

    /*  ======================================
            Parallax 
        ====================================== */
    var parallax_effect = $('.parallax');
    parallax_effect.jarallax({
        speed: 0.5
    });

    /*  ======================================
            google map
        ====================================== */
    if ($('#map').length > 0) {
        var myCenter = new google.maps.LatLng(-33.7654872, 150.9103569);

        function initialize() {
            var mapProp = {
                zoom: 16,
                center: myCenter,
                scrollwheel: false,
                styles: [{
                        "featureType": "all",
                        "elementType": "labels.text.fill",
                        "stylers": [{
                                "saturation": 36
                            },
                            {
                                "color": "#546E7A"
                            },
                            {
                                "lightness": 40
                            }
                        ]
                    },
                    {
                        "featureType": "all",
                        "elementType": "labels.text.stroke",
                        "stylers": [{
                                "visibility": "on"
                            },
                            {
                                "color": "#000000"
                            },
                            {
                                "lightness": 16
                            }
                        ]
                    },
                    {
                        "featureType": "all",
                        "elementType": "labels.icon",
                        "stylers": [{
                            "visibility": "off"
                        }]
                    },
                    {
                        "featureType": "administrative",
                        "elementType": "geometry.fill",
                        "stylers": [{
                                "color": "#546E7A"
                            },
                            {
                                "lightness": 20
                            }
                        ]
                    },
                    {
                        "featureType": "administrative",
                        "elementType": "geometry.stroke",
                        "stylers": [{
                                "color": "#546E7A"
                            },
                            {
                                "lightness": 17
                            },
                            {
                                "weight": 1.2
                            }
                        ]
                    },
                    {
                        "featureType": "landscape",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#000000"
                            },
                            {
                                "lightness": 20
                            }
                        ]
                    },
                    {
                        "featureType": "poi",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#000000"
                            },
                            {
                                "lightness": 21
                            }
                        ]
                    },
                    {
                        "featureType": "road.highway",
                        "elementType": "geometry.fill",
                        "stylers": [{
                                "color": "#000000"
                            },
                            {
                                "lightness": 17
                            }
                        ]
                    },
                    {
                        "featureType": "road.highway",
                        "elementType": "geometry.stroke",
                        "stylers": [{
                                "color": "#000000"
                            },
                            {
                                "lightness": 29
                            },
                            {
                                "weight": 0.2
                            }
                        ]
                    },
                    {
                        "featureType": "road.arterial",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#000000"
                            },
                            {
                                "lightness": 18
                            }
                        ]
                    },
                    {
                        "featureType": "road.local",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#000000"
                            },
                            {
                                "lightness": 16
                            }
                        ]
                    },
                    {
                        "featureType": "transit",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#546E7A"
                            },
                            {
                                "lightness": 19
                            }
                        ]
                    },
                    {
                        "featureType": "water",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#546E7A"
                            },
                            {
                                "lightness": 17
                            }
                        ]
                    }
                ],
                mapTpeIdy: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map"), mapProp);
            //add your location marker here 
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(-33.7654872, 150.9103569),
                map: map,
                draggable: true
            });
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    }

    $(window).on('load', function () {

        /*  ======================================
                Preloader
            ====================================== */
        var preloader = $('.preloader');
        preloader.fadeOut('500');

        /*  ======================================
                Isotope
            ====================================== */
        // init Isotope
        var isotope_content = $('.iso-content');
        isotope_content.isotope({
            itemSelector: '.iso-item',
            percentPosition: true,
            masonry: {
                // use outer width of grid-sizer for columnWidth
                columnWidth: '.iso-item'
            }
        });
        // filter items on button click
        var isotope_nav = $('.iso-nav ul li');
        isotope_nav.on('click', function () {
            $('.iso-nav ul li').removeClass('gallery-active');
            $(this).addClass('gallery-active');
            var selector = $(this).attr('data-filter');
            $('.iso-content').isotope({
                filter: selector
            });
            return false;
        });
    });
}(jQuery));
