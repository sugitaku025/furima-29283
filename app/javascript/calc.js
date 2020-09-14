window.addEventListener('load', function(){
  const price = document.getElementById("item-price")
  const commission = document.getElementById("add-tax-price")
  const sales_profit = document.getElementById("profit")

  price.addEventListener('input', function() {
    const str = this.value
    const fee = Math.floor( str * 0.1 )
    profit = str - fee
    commission.innerHTML = ( "Math.floor", fee)
    sales_profit.innerHTML = profit
  })
})