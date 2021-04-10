function search () {
  const topPageSearch = document.getElementById("top-page-search");
  const searchForm = document.getElementById("item-search-form");
  topPageSearch.addEventListener('mouseover', () => {
    topPageSearch.setAttribute("style", "color: #de4d4d;");
  });
  topPageSearch.addEventListener('mouseout', () => {
    topPageSearch.removeAttribute("style", "color: #de4d4d;");
  });
  topPageSearch.addEventListener('click', () => {
    if (searchForm.getAttribute("style") == "display: block;"){
    searchForm.removeAttribute("style", "display: block;");
    }else{
    searchForm.setAttribute("style", "display: block;");
    };
  });
}

window.addEventListener('load', search);