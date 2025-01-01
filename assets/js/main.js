jQuery(document).ready(function () {

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

	function loadImage(image_url) {
		return new Promise((resolve, reject) => {
			const img = new Image();
			img.onload = () => resolve(img);
			img.onerror = reject;
			img.src = image_url;
		});
	}

	function watermark(canvasid, target_image_url, watermark_image_url=$('#main_logo').attr("src")) {
		const canvas = document.getElementById(canvasid);
		const ctx = canvas.getContext('2d');

		Promise.all([
			loadImage(target_image_url),
			loadImage(watermark_image_url)
		]).then(([mainImage, watermarkImage]) => {
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
		}).catch(error => {
			console.error('Error applying watermark');
		});
	}


	function modalOpen(image, image_location, related_item, image_width) {
		console.log(image, image_location, related_item, image_width);
		/*==modal width set==*/
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
		// img_div.style.left = `calc(${right}px - 0px)`; // -20px for container padding

		//document.getElementById("modal-content").style.width = modal_width+'px';
		document.getElementById("img").style.width = modal_width + 'px';
		document.getElementById("img").style.minHeight = contentDivheight - 72 + 'px';
		//$('.related_image').hide();
		var site_url = $('.site_url').val() + '/';
		image_location = image_location.replace(/\/+$/, '') + '/';

		const image_url = site_url + image_location + image;
		// console.log(site_url, image_url);
		//$(".modal-body .image_view").attr( "src", image );
		// $("#img1 img.img1").attr("src", image_url);
		watermark('canvas_img1', image_url);

		/*==next prev button==*/
		if (related_item != '') {
			var related_image = site_url + image_location + related_item;
			watermark('canvas_img2', related_image);
			//$(".modal-body .related_image").attr( "src", related_image );
			// $("#img2 img.img2").attr("src", related_image);
			//$('.nxt').show();
			//$('.prvs').hide();
			$("#img2").show();
		} else {
			$("#img2").hide();
		}

		$('#img').show();

		window.scrollTo({
			left: document.body.scrollWidth, //Scroll to the end of the body
			behavior: 'smooth'
		});

	}

	window.watermark = watermark;
	window.modalOpen = modalOpen;


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

