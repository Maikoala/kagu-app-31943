function shop () {
  if (document.getElementById('shops')){
    const Shop = document.getElementById("shops");
    const ShopList = document.getElementById("shop-list");
    Shop.addEventListener('mouseover', () => {
      Shop.setAttribute("style", "color: #de4d4d;");
    });
    Shop.addEventListener('mouseout', () => {
      Shop.removeAttribute("style", "color: #de4d4d;");
    });
    Shop.addEventListener('click', () => {
      if (ShopList.getAttribute("style") == "display: block;"){
      ShopList.removeAttribute("style", "display: block;");
      }else{
      ShopList.setAttribute("style", "display: block;");
      };
    });
  };
}

window.addEventListener('load', shop);