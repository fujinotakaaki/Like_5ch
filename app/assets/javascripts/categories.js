// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
const scrollBottom = () => {
  let element = document.documentElement;
  let bottom = element.scrollHeight - element.clientHeight;
  $('html, body').animate({scrollTop: bottom}, 'fast' );
  return false;
}
