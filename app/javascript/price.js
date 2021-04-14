function price () {
  const inputPrice = document.getElementById('item-price');
  const taxPrice = document.getElementById('tax-price');
  const excludingTax = document.getElementById('excluding-tax');
  inputPrice.addEventListener('input', () => {
    const tenPercent = Math.floor(inputPrice.value * 0.1);
    taxPrice.innerHTML = tenPercent;
    excludingTax.innerHTML = inputPrice.value - tenPercent;
  });
}

window.addEventListener('load', price);