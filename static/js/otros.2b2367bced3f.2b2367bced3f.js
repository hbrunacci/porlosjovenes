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

(function ($) {
    'use strict';
 

    /*---------- partners slider ---------*/
    $('.sponsors').owlCarousel({
        /*navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],*/
        loop: true,
        nav: false,
        autoplay: true,
        margin: 20,
        autoplayTimeout: 3000,
        mouseDrag: true,
        responsive: {
            0: {
                items: 3
            },
            600: {
                items: 6
            },
            1000: {
                items: 8
            }
        }
    });

}(jQuery));
