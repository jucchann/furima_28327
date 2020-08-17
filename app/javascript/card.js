const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);　// PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log(e.target);

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_delivery_address[number]"),
      cvc: formData.get("purchase_delivery_address[cvc]"),
      exp_month: formData.get("purchase_delivery_address[exp_month]"),
      exp_year: `20${formData.get("purchase_delivery_address[exp_year]")}`,
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("purchase_delivery_address_number").removeAttribute("name");
        document.getElementById("purchase_delivery_address_cvc").removeAttribute("name");
        document.getElementById("purchase_delivery_address_exp_month").removeAttribute("name");
        document.getElementById("purchase_delivery_address_exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        alert(response.error.message);
      }
    });
  });
};

window.addEventListener("load", pay);
