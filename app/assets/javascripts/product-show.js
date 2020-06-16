$(function() {
  $(".product-show__content__image__list img").mouseover(function() {
    $(".product-show__content__image__main").attr("src", $(this).attr("src"));
    return false;
  });
});