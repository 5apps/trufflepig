$(function(){

  var video = document.getElementById('video');
  var canvas = document.getElementById('canvas');
  var filmroll = document.getElementById("filmroll")
  var prefix;

  if (navigator.getUserMedia) {
    prefix = "none";
    navigator.getUserMedia('video', successCallback, errorCallback);
  }
  else if (navigator.webkitGetUserMedia) {
    prefix = "webkit";
    navigator.webkitGetUserMedia('video', successCallback, errorCallback);
  }
  else {
    alert('Native web camera streaming is not supported in this browser.');
  }

  function successCallback(stream) {
    if (prefix == "none") {
      video.src = stream;
    }
    else if (prefix == "webkit") {
      video.src = window.webkitURL.createObjectURL(stream)
    }
  }

  function errorCallback(error) {
    console.error('An error occurred: [CODE ' + error.code + ']');
    return;
  }

  var snap = function () {
    canvas.width = video.clientWidth;
    canvas.height = video.clientHeight;

    c = canvas.getContext("2d");
    c.drawImage(video, 0, 0, canvas.width, canvas.height);

    img = document.createElement("img");
    img.src = canvas.toDataURL("image/png");
    img.style.padding = 5;
    img.width = canvas.width / 6;
    img.height = canvas.height / 6;

    filmroll.appendChild(img);

    toggleVideo();
    setTimeout(toggleVideo, 1500);
  }

  var toggleVideo = function() {
    $(video).toggle();
  }

  $('#toggleVideo').on('click', function(){
    toggleVideo();
  });

  $('#snapshot').on('click', function(){
    snap();
  });

});
