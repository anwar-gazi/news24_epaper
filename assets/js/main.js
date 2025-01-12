jQuery(document).ready(function () {

	// (function () {
	// 	const navToggle = document.getElementById('nav-y-toggle');
	// 	const navbar = document.getElementById('right-navbar');
	// 	const body = document.body;

	// 	navToggle.addEventListener('click', () => {
	// 		navbar.classList.toggle('open');
	// 		document.body.classList.toggle('blur');
	// 	});
	// })();

	(function () {
		const home_url = rtrimForwardSlash($('a#home_url').attr('href'));
		$('#search_input').keypress(function (event) {
			if (event.which === 13 && event.target.value.trim()) {
				const needle = encodeURIComponent(event.target.value);
				const url = home_url + "?q=" + needle;
				window.location = url;
			}
		});
	})();

	const enableDays = $('#Datepicker1').data('publisheddates');
	// function enableAllTheseDays(date) {
	// 	var sdate = $.datepicker.formatDate('yy-mm-dd', date)
	// 	if ($.inArray(sdate, enableDays) != -1) {
	// 		return [true];
	// 	}
	// 	return [false];
	// }
	$('#Datepicker1').datepicker({
		firstDay: 6,
		dateFormat: 'yy-mm-dd',
		beforeShowDay: (date) => {
			var sdate = $.datepicker.formatDate('yy-mm-dd', date)
			if ($.inArray(sdate, enableDays) != -1) {
				return [true];
			}
			return [false];
		},
		monthNames: ["জানুয়ারী", "ফেব্রুয়ারী", "মার্চ", "এপ্রিল", "মে", "জুন", "জুলাই", "আগস্ট", "সেপ্টেম্বর", "অক্টোবর", "নভেম্বর", "ডিসেম্বর"],
		dayNamesMin: ["রবি", "সোম", "মঙ্গল", "বুধ", "বৃহঃ", "শুক্র", "শনি"]
	});

	$("#Datepicker1").on("change", function () {
		var archive_date = $(this).val();
		console.log(archive_date);
		var site_url = $(".site_url").val();
		if (archive_date == '') {
			alert('Please Select A Valid Date !');
			window.reload();
		}
		if (archive_date != null) {
			var request_url = site_url + '/nogor-edition/' + archive_date + '/1';
			window.location = request_url;
		}
	});

	// datepicker hide control
	$(document).on('click', (e) => {
		const p = $(e.target).closest('div#Datepicker1');
		const p2 = $(e.target).closest('div.datepicker_wrapper');
		if ($('#Datepicker1').is(':visible')) { // is datepicker open
			// console.log(p.length, p2.length);
			if (!p.length && !p2.length && !$(e.target).hasClass('ui-icon')) {
				$('#Datepicker1').hide();
			}
		}
	});

	/*#############################
	## onmouse hover show dropdown 
	###############################*/
	jQuery('ul.nav li.dropdown').hover(function () {
		jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn();
	}, function () {
		jQuery(this).find('.dropdown-menu').stop(true, true).delay(300).fadeOut();
	});


	/*#############################
	## search date dropdown active 
	###############################*/

	$('.get_archive').click(function () {
		localStorage['date'] = "yes";
	});

	var site_url_name = jQuery('.site_url_name').val();
	if (site_url_name == 'By Edition' || site_url_name == 'All Pages') {
		if (localStorage['date'] == "yes") {
			var cDate = jQuery('.current_date').val();
			var arr = cDate.split('-');
			var year = arr[0];
			var month = arr[1];
			var day = arr[2];
			$("#datepick .day").val(day).change();
			$("#datepick .month").val(month).change();
			$("#datepick .year").val(year).change();
		}
	}
	if (site_url_name == 'Home') {
		localStorage.removeItem('date');
	}

	function exec(callbacks = []) {
		callbacks.forEach(callback => {
			console.log(callbacks);
			callback();
		});
	}

	function translate() {
		document.getElementById("news_date").innerText = bn.date(document.getElementById("news_date").innerText, 'YYYY-MM-DD', 'DD-MM-YYYY');
		setTimeout(() => {
			$('.ui-datepicker-year').text(bn.bn($('.ui-datepicker-year').text()));
			// $('.ui-datepicker-calendar tr td a, .ui-datepicker-calendar tr td span').each(function () {
			// 	const text = $(this).text();
			// 	$(this).text(bn.bn(text));
			// });
		}, 500);
	}

	function loadImage(image_url) {
		return new Promise((resolve, reject) => {
			const img = new Image();
			img.src = image_url;
			img.onload = () => resolve(img);
			img.onerror = reject;
		});
	}

	function watermark(canvasid, target_image_url, watermark_image_url = $('#main_logo').attr("src"), after = (canvas) => { }) {
		Promise.all([
			loadImage(target_image_url),
			loadImage(watermark_image_url)
		]).then(([mainImage, watermarkImage]) => {
			const canvas = document.getElementById(canvasid);
			const ctx = canvas.getContext('2d');

			canvas.width = mainImage.naturalWidth;
			canvas.height = mainImage.naturalHeight;

			ctx.drawImage(mainImage, 0, 0); // Draw main image

			const watermarkWidth = watermarkImage.naturalWidth;
			const watermarkHeight = watermarkImage.naturalHeight;
			// Calculate centered position for watermark
			const x = (canvas.width - watermarkWidth) / 2;
			const y = (canvas.height - watermarkHeight) / 2;

			ctx.globalAlpha = 0.2; // Set watermark opacity
			ctx.drawImage(watermarkImage, x, y, watermarkWidth, watermarkHeight);
			ctx.globalAlpha = 1.0; // Reset opacity

			after(canvas);
		}).catch(error => {
			console.error('Error applying watermark');
		});
	}


	function modalOpen(image, image_location, related_item, image_width) {
		var modal_width = image_width;
		if (modal_width > 1050) {
			modal_width = 1050;
		}
		if (modal_width < 750) {
			modal_width = 750;
		}

		const content_div = document.getElementById('content_div');
		const img_div = document.getElementById('img');

		const rect = content_div.getBoundingClientRect();
		const right = rect.right + window.scrollX; // Add scrollX to get document coordinates
		const top = rect.top + window.scrollY; // Add scrollY to get document coordinates

		const contentDivWidth = content_div.offsetWidth; // Get the width including padding and border
		const contentDivheight = content_div.offsetHeight; // Get the width including padding and border

		document.getElementById("img").style.width = modal_width + 'px';
		document.getElementById("img").style.minHeight = contentDivheight - 72 + 'px';
		var site_url = $('.site_url').val() + '/';
		image_location = image_location.replace(/\/+$/, '') + '/';

		const image_url = site_url + image_location + image;
		watermark('canvas_img1', image_url);

		if (related_item != '') {
			var related_image = site_url + image_location + related_item;
			watermark('canvas_img2', related_image);
			$("#img2").show();
		} else {
			$("#img2").hide();
		}

		$('#img').removeClass("d-md-none");
		$("header#header_non-sticky, #content_div, #contentBelow_pagesUl, .footer").addClass("d-md-none");
		$('#contentBelow_pagesUl').removeClass('d-md-flex');

		window.scrollTo({
			left: document.body.scrollWidth, //Scroll to the end of the body
			behavior: 'smooth'
		});

	}

	function closePreview() {
		$('#img').addClass("d-md-none");
		$("header#header_non-sticky, #content_div, #contentBelow_pagesUl, .footer").removeClass("d-md-none");
		$('#contentBelow_pagesUl').addClass('d-md-flex');
		if (window.matchMedia('(max-width: 768px)')) {

		}
	}

	function imagePrinWindow(src) {
		// const canvas = document.getElementById("printable");
		var newWinPage = window.open('print', 'Print-Window');

		newWinPage.document.open();

		newWinPage.document.write('<html><title>niropekkho</title><body onload="window.print()">' + '<center>' + '<img src=' + src + ' />' + '</center></body></html>');

		newWinPage.document.close();
		setTimeout(function () {
			newWinPage.close();
		}, 10);
	}

	function printPage(printPage) {
		watermark("printable", printPage, $('#main_logo').attr("src"), (canvas) => imagePrinWindow(canvas.toDataURL()));
	}

	function stickyHeader() {
		const timenow = moment($('#news_date').text()).format('DD MMMM YYYY');
		$('#today_date').text(timenow);
		$('.sticky-categories-nav').html($('div.categories-nav nav').prop('outerHTML'));

		const nav = document.getElementById('header_non-sticky');
		const hiddenDiv = document.getElementById('header_sticky');

		const observer = new IntersectionObserver(
			([entry]) => {
				if (!entry.isIntersecting) {
					// hiddenDiv.style.display = 'block';
					hiddenDiv.classList.add('d-lg-flex');
				} else {
					// hiddenDiv.style.display = 'none';
					hiddenDiv.classList.remove('d-lg-flex');
				}
			},
			{ threshold: 0 }
		);

		observer.observe(nav);
	}

	function pagesUlBelow() {
		$('#sideLeft_pagesUl').prop('outerHTML');
		$('#contentBelow_pagesUl').html($('#sideLeft_pagesUl').prop('outerHTML'));
	}

	function populate_bn_dates() {
		$('div.news-popup .date-bn').text(moment($('#news_date').text()).format('dddd DD MMMM YYYY'));
	}

	function show(id) {
		if (id.startsWith(".") || id.startsWith("#")) {
			var selector = id;
		} else {
			var selector = '#' + id;
		}
		$(selector).show();
	}
	function hide(id) {
		if (id.startsWith(".") || id.startsWith("#")) {
			var selector = id;
		} else {
			var selector = '#' + id;
		}
		$(selector).hide();
	}

	translate();
	stickyHeader();
	// pagesUlBelow();
	populate_bn_dates();

	window.watermark = watermark;
	window.modalOpen = modalOpen;
	window.closePreview = closePreview;
	window.printPage = printPage;
	window.show = show;
	window.hide = hide;
	window.exec = exec;

	$('area.featured').click();


});

/*==============javascript=====================*/

/***********image zooming**************/
// function zoomin(){
//   var myImg = document.getElementById("singleNewsImg");
//   var currWidth = myImg.clientWidth;

//   if(currWidth > 2000){
//     return false;
//   } else{
//     myImg.style.width = (currWidth + 50) + "px";
//   } 
// }
// function zoomout(){
//   var myImg = document.getElementById("singleNewsImg");
//   var currWidth = myImg.clientWidth;
//   if(currWidth < 200){
//     return false;
//   } else{
//     myImg.style.width = (currWidth - 50) + "px";
//   }
// }
/***********image zooming end**************/


/*#############################
## handle right sidebar tab 
###############################*/
function openCity(evt, tab_name) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}
	document.getElementById(tab_name).style.display = "block";
	evt.currentTarget.className += " active";
}

