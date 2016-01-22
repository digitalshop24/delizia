$(document).ready(function(){

	$('#foo1').owlCarousel({
		items : 1,
		pagination : false,
		navigation : true,
		singleItem : true,
		navigationText: ["", ""]
	});

	$('#foo2').owlCarousel({
		items : 1,
		pagination : false,
		navigation : true,
		singleItem : true,
		navigationText: ["", ""],
		transitionStyle : "fade"
	});

	$('.consultation form .submit').click(function(e){
		e.preventDefault();
		$('.consultation').html('<div class="thank"><p class="thank-title">Ваша заявка принята!</p><p>Совсем скоро с Вами свяжется наш консультант.</p></div>')
	})

	$('.feedback .form .submit').click(function(e){
		e.preventDefault();
		$('.feedback').html('<div class="thank"><p class="thank-title">Ваша заявка принята!</p><p>Совсем скоро с Вами свяжется наш консультант.</p></div>')
	})	

	// select
	$('#producer').styler({
		selectPlaceholder : 'Производитель'
	});

	$('#type').styler({
		selectPlaceholder : 'Тип помещения'
	});	

	$('#appointment').styler({
		selectPlaceholder : 'Назначение'
	});


	$('#slider1, #slider2').rangeSlider({
		bounds: {min: 0, max: 150},
		defaultValues: {min:15,max:100},
		arrows: false,
		symmetricPositionning: true
	});

	$('.fancybox').fancybox({
		helpers: {
			overlay: {
				locked: false
			}
		}		
	});

	// =заглушка для IE
	var browser = navigator.userAgent.indexOf("MSIE");
	var version = parseInt(navigator.userAgent.substr(browser + 5, 2));
	if (version !== -1) var IE = true;
	if (IE && version < 9) {
		var IEhelp = document.createElement("div");
		IEhelp.style.width = "100%";
		IEhelp.style.padding = "11px";
		IEhelp.style.backgroundColor = "#CC3333";
		IEhelp.style.color = "#FFFFFF";
		IEhelp.style.textAlign = "center";
		IEhelp.style.font = "normal 14px/1.2 Helvetica Neue, Tahoma, Verdana, Arial, sans-serif";
		IEhelp.innerHTML = 'Внимание! Вы используете устаревший браузер. <a href="/ie6/ie6.html" target="_blank" style="color: #FFFFFF; text-decoration: underline;">Подробнее &#187;</a>';
		if (document.body.firstChild) {
			document.body.insertBefore(IEhelp, document.body.firstChild);
		}
		else {
			document.body.appendChild(IEhelp);
		}
	}
	// =/заглушка для IE		
})
