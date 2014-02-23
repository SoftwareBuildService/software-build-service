// Display a new logo over a gradient background
jQuery("#header").css("background-color", "rgb(220, 220, 220)").css("background-image", "-webkit-gradient(linear, 0 0, 0 100%, from(rgb(220, 220, 220)), to(rgb(220, 220, 220)))").css("background-image", "-webkit-linear-gradient(rgb(249, 249, 249), rgb(220, 220, 220))").css("background-image", "-moz-linear-gradient(rgb(249, 249, 249), rgb(220, 220, 220))").css("background-image", "-o-linear-gradient(rgb(249, 249, 249), rgb(220, 220, 220))").css("background-image", "linear-gradient(rgb(249, 249, 249), rgb(220, 220, 220))").css("background-repeat", "repeat-x").css("border-bottom-color", "rgb(200, 200, 200)").css("border-bottom-style", "solid").css("border-bottom-width", "1px").css("height", "60px");
jQuery("div#branding img").attr("src", "/img/Logo_large.png").css("display", "block").css("height", "52px").css("width", "205px").css("padding-left", "10px").css("padding-top", "8px").wrap("<a href='/'/>");;

// Change the color of the right side text
jQuery("#head-link-r").css("color", "#d8006f");
jQuery("div#logo").css("color", "grey");
