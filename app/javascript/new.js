$(function () {
  $(document).on('input', '#item-price', function () {
    const inputPrice = $(this).val();
    const fee = Math.round(inputPrice * 0.1);
    const profits = (inputPrice - fee)
    $('#add-tax-price').html(fee);
    $('#profit').html(profits);
  });
});
