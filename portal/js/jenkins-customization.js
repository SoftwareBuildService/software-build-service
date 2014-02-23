// Display a new logo over a gradient background
jQuery("#heading").parent().parent().attr("style", "");
jQuery("#jenkins-home-icon").css("margin-top", "8px").css("padding-left", "10px").css("height", "52px").css("width", "205px").attr("src", "/img/Logo_large.png");
jQuery("#jenkins-home-link").attr("href", "/");
jQuery("#top-panel").css("display", "block").css("background-color", "rgb(220, 220, 220)").css("background-image", "-webkit-gradient(linear, 0 0, 0 100%, from(rgb(220, 220, 220)), to(rgb(220, 220, 220)))").css("background-image", "-webkit-linear-gradient(rgb(249, 249, 249), rgb(220, 220, 220))").css("background-image", "-moz-linear-gradient(rgb(249, 249, 249), rgb(220, 220, 220))").css("background-image", "-o-linear-gradient(rgb(249, 249, 249), rgb(220, 220, 220))").css("background-image", "linear-gradient(rgb(249, 249, 249), rgb(220, 220, 220))").css("background-repeat", "repeat-x").css("border-bottom-color", "rgb(200, 200, 200)").css("border-bottom-style", "solid").css("border-bottom-width", "1px").css("height", "60px");

// Change the color of the right side text
jQuery("#login-field A").css("color", "grey");
