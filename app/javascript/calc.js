window.addEventListener('load', function(){
  console.log("calc.js")
  const price = document.getElementById("item-price")
  console.log(price)
  const commission = document.getElementById("add-tax-price")
  const sales_profit = document.getElementById("profit")

  price.addEventListener('input', function() {
    const str = this.value
    const fee = str * 0.1
    profit = str - fee
    commission.innerHTML = fee
    sales_profit.innerHTML = profit
  })
})