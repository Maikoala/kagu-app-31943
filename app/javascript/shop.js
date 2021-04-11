function shop () {
  const topShop = document.getElementById("top-shops");
  const topShopList = document.getElementById("top-shop-list");
  topShop.addEventListener('mouseover', () => {
    topShop.setAttribute("style", "color: #de4d4d;");
  });
  topShop.addEventListener('mouseout', () => {
    topShop.removeAttribute("style", "color: #de4d4d;");
  });
  topShop.addEventListener('click', () => {
    if (topShopList.getAttribute("style") == "display: block;"){
    topShopList.removeAttribute("style", "display: block;");
    }else{
    topShopList.setAttribute("style", "display: block;");
    };
  });
}

window.addEventListener('load', shop);