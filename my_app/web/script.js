function getData() {  
  console.log(navigator);
  return navigator;
}

function isBrave(){
  var isBrave=(navigator.brave &&  navigator.brave.isBrave() || false);
  return isBrave;
}