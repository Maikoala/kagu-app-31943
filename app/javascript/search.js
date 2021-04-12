function shop () {
  const Shop = document.getElementById("form-shops");
  const ShopList = document.getElementById("form-shop-list");
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
}

window.addEventListener('load', shop);