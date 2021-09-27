import Rails from "@rails/ujs";

document.addEventListener("DOMContentLoaded", function(event) {
  const menuFirstItems = document.getElementsByClassName('menu-first-item');
  Array.from(menuFirstItems).forEach(function(element) {
    element.addEventListener('click', function (){
      let child = element.nextElementSibling
      if(child.style.display === 'none'){
        child.style.display = "block";
      } else {
        child.style.display = "none";
      }
    });
  });

  const nestedMenuItems = document.getElementsByClassName('menu-nested-item');
  Array.from(nestedMenuItems).forEach(function(childItem) {
    childItem.addEventListener('click', function (){
      let productTypeId = childItem.getAttribute('data-type-id');
      let manufacturerId = childItem.getAttribute('data-manufacturer-id');
      Rails.ajax({
        type: "get",
        url: window.location.href,
        data: "product_type_id=" + productTypeId + "&manufacturer_id=" + manufacturerId,
        dataType: "script"
      });
    });
  });
});