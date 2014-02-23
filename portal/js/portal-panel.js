function poller()
{
    // wait until jQuery becomes ready
    if(typeof jQuery !== "undefined") {

        // settings
        var animMillis = 200;
        var collapsedWidth = 30;
        var height = 30;
        var expandedWidth = 350;
        var logo = "/img/Logo.png";
        var email = "xxx@yyy.zzz";
        var germanMailText = "Hallo Support Team,%0A%0AQuelle: " + window.location.href + "%0A%0A%0A%0AMit freundlichen Gruessen,%0A";
        var englishMailText = "Hello Support Team,%0A%0AOrigin: " + window.location.href + "%0A%0A%0A%0AWith Kind regards,%0A";

        // add center method to jQuery
        jQuery.fn.center = function () {
            this.css("position", "fixed");
            this.css("top", "0px");
            var width = jQuery(this).width();
            var left = Math.max(0, ((jQuery(window).width() - width) / 2) + 
                                                        jQuery(window).scrollLeft());
            this.css("left", left + "px");
            return this;
        }
        
        // detect mail language
        var language = window.navigator.userLanguage || window.navigator.language;
        var mailText = englishMailText;
        if (language.indexOf('de') == 0) {
            mailText = germanMailText;
        }

        // add markup
        jQuery("body").append('<div id="portalPanel"><div id="portalMenu"><span class="portalButton portalButtonMagenta" id="portalJenkins"><a href="/jenkins/">Jenkins</a></span> <span class="portalButton portalButtonDark" id="portalSonarqube"><a href="/sonarqube/">SonarQube</a></span> <span class="portalButton portalButtonLight" id="portalNexus"><a href="/nexus/">Nexus</a></span> <span class="portalButton portalButtonDark" id="portalWiki"><a href="/wiki/">Wiki</a></span> <span class="portalButton portalButtonMagenta" id="portalMail"><a href="mailto:' + email + '?body=' + mailText + '">Mail</a></span></div><img id="portalLogo" src="' + logo + '"/></div>');

        // style markup
        jQuery("#portalPanel").css("position", "fixed").css("margin", "0").css("padding", "15px").css("border", "0").css("width", collapsedWidth + "px").css("height", height + "px").css("background-color", "rgba(255,255,255, 0.9)").css("border-top", "0px").css("border-left", "1px solid #b8b8b8").css("border-right", "1px solid #b8b8b8").css("border-bottom", "1px solid #b8b8b8").css("border-bottom-left-radius", "5px 5px").css("border-bottom-right-radius", "5px 5px").css("z-index", "1000");
        jQuery("#portalLogo").css("width", collapsedWidth + "px").css("height", height + "px");
        jQuery("#portalMenu").css("padding", "5px").css("text-align", "center").css("font-family", "Tele-GroteskNor, Source Sans Pro").css("font-size", "11px");
        jQuery(".portalButton").css("border-radius", "5px").css("padding", "10px").css("margin", "5px").css("-moz-transition", "background-color .25s ease-in-out").css("-webkit-transition", "background-color .25s ease-in-out").css("-o-transition", "background-color .25s ease-in-out").css("-ms-transition", "background-color .25s ease-in-out").css("transition", "background-color .25s ease-in-out");
        jQuery(".portalButton a:link").css("text-decoration", "none").css("color", "white").css("padding-top", "5px").css("padding-bottom", "5px");
        jQuery(".portalButtonMagenta").css("background-color", "#d8006f");
        jQuery(".portalButtonDark").css("background-color", "#4c4c4c");
        jQuery(".portalButtonLight").css("background-color", "#b8b8b8");

        // button animation
        jQuery(".portalButtonMagenta").hover(function() {
            jQuery(this).css("background-color", "#f59fcd");
        }, function() {
            jQuery(this).css("background-color", "#d8006f");
        });
        jQuery(".portalButtonDark").hover(function() {
            jQuery(this).css("background-color", "#b1b1b1");
        }, function() {
            jQuery(this).css("background-color", "#4c4c4c");
        });
        jQuery(".portalButtonLight").hover(function() {
            jQuery(this).css("background-color", "#f2f2f2");
        }, function() {
            jQuery(this).css("background-color", "#b8b8b8");
        });

        // make box relocate when browser window is resized
        jQuery(window).bind('resize', function() {
            jQuery('#portalPanel').center();
        });

        // initial state
        jQuery("#portalPanel").center();
        jQuery("#portalLogo").show();
        jQuery("#portalMenu").hide();
        
        // animate the box
        var dirin = true;
        jQuery("#portalPanel").hover(function() {
            dirin = true;
            jQuery('#portalMenu').clearQueue().stop(true, true, true);
            jQuery('#portalPanel').clearQueue().stop(true, true, true);
            jQuery('#portalLogo').clearQueue().stop(true, true, true);

            if (dirin) {
                jQuery('#portalLogo').fadeOut(animMillis, function() {
                    if (dirin) {
                        var left = Math.max(0, ((jQuery(window).width() - expandedWidth) / 2) + 
                                                                jQuery(window).scrollLeft());
                        jQuery('#portalPanel').animate({'width':expandedWidth + 'px', 'left':left + 'px'}, animMillis, 'swing', function() {
                            if (dirin) {
                                jQuery('#portalMenu').fadeIn(animMillis, function() {
                                    // do nothing
                                });
                            }
                        });
                    }
                });
            }
        }, function() {
            dirin = false;
            jQuery('#portalMenu').clearQueue().stop(true, true, true);
            jQuery('#portalPanel').clearQueue().stop(true, true, true);
            jQuery('#portalLogo').clearQueue().stop(true, true, true);
            
            if (!dirin) {
                jQuery('#portalMenu').fadeOut(animMillis, function() {
                    if (!dirin) {
                        var left = Math.max(0, ((jQuery(window).width() - collapsedWidth) / 2) + 
                                                                    jQuery(window).scrollLeft());
                        jQuery('#portalPanel').animate({'width':collapsedWidth + 'px', 'left':left + 'px'}, animMillis, 'swing', function() {
                            if (!dirin) {
                                jQuery('#portalLogo').fadeIn(animMillis, function() {
                                    jQuery('#portalLogo').show();
                                });
                            }
                        });
                    }
                });
            }
        });
    }
    else
    {
        setTimeout(poller, 100);
    }    
}

poller();