console.log("AMB: "+ ambid);
var inViewTimeout;
var isRunning = false;
var ipData ={
  "ip": "",
  "hostname": "",
  "city": "",
  "region": "",
  "country": "",
  "loc": "",
  "org": "",
  "hover_sec":0,
  "inView_sec":0
};
var isActive;

window.onfocus = function () { 
  isActive = true; 
}; 

window.onblur = function () { 
  isActive = false; 
}; 

if (window.$ === undefined || typeof(window.$) !== "function") {
   console.log('Adding jQuery...');
   var script = document.createElement('script');
   script.src = "./js/jquery.min.js";
   document.head.appendChild(script);
}
$('head').append('<link rel="stylesheet" href="css/pry_style.css" type="text/css" />');



ipData.hover_sec = 0;

$('.pry_card').mouseenter(function() {
   hoverTimeout = setInterval(function() {
        ipData.hover_sec++;
        console.log("hover: "+ipData.hover_sec);
    }, 1000);
}).mouseleave(function() {
    clearInterval(hoverTimeout);
});

/*$('.pry_card').appear(function(){
  console.log('visible');
  
});

$(window).onScroll(function(){
  console.log('SCROLLING');
});*/



function getData(){
  if (!Boolean(ipData.ip)) {
    $.get("http://ipinfo.io", function(response) {
      console.log("data: "+ response);
        ipData.ip= response.ip,
        ipData.hostname = response.hostname,
        ipData.city= response.city,
        ipData.region= response.region,
        ipData.country= response.country,
        ipData.loc= response.loc,
        ipData.org= response.org
    }, "jsonp");
  }
    
  if (!isRunning) {
    isRunning = true
    inViewTimeout = setInterval(function() {
      if (isActive){
        if (ipData.inView_sec % 60 == 0)
          sendUpdate();
        ipData.inView_sec++;
        console.log("view: "+ipData.inView_sec);
      }
    }, 1000); 
  }
}

function isScrolledIntoView(elem)
{
    var $elem = $(elem);
    var $window = $(window);

    var docViewTop = $window.scrollTop();
    var docViewBottom = docViewTop + $window.height();

    var elemTop = $elem.offset().top;
    var elemBottom = elemTop + $elem.height();

    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
}

if (isScrolledIntoView) {
  getData();
}
/*
  "ip": "41.191.242.146",
  "hostname": "No Hostname",
  "city": "Accra",
  "region": "Greater Accra Region",
  "country": "GH",
  "loc": "5.5500,-0.2167",
  "org": "AS37103 BusyInternet Ghana Ltd"
*/

$(window).scroll(function(){
  if(isScrolledIntoView('.pry_card')){
    getData();
  }else{
    if (isRunning) {
      clearInterval(inViewTimeout);
      isRunning = false;
    }
  }
});


function sendUpdate(){
    var hov = ipData.hover_sec;
    var iv = ipData.inView_sec;
  $.ajax({
    url: "http://localhost:3000/ambassadors/1/impressions",
    xhrFields: { withCredentials: true },
    type: 'POST',
    data: {
      impression:{
        source: window.location.href,
        hover_time: hov,
        view_time: iv,
        city: ipData.city,
        country: ipData.country,
        ip: ipData.ip,
        region: ipData.region,
        coord: ipData.loc
      }
    }
  }).done(function(){
      ipData.hover_sec -= hov;
      ipData.inView_sec -= iv;
  });
}