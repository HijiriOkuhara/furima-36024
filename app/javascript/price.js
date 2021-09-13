function price (){
  const item_price = document.getElementById("item-price");
  item_price.addEventListener("keyup", () => {
    const fee = item_price.value * 0.1;
    const add_tax_price = document.getElementById("add-tax-price");
    add_tax_price.innerHTML = `${fee}`;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${item_price.value - fee}`;
  });
};

window.addEventListener('load', price);