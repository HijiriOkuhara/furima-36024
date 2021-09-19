const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_record_delivery_area[number]"),
      cvc: formData.get("purchase_record_delivery_area[cvc]"),
      exp_month: formData.get("purchase_record_delivery_area[exp_month]"),
      exp_year: `20${formData.get("purchase_record_delivery_area[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        formResult.insertAdjacentHTML("beforeend", tokenObj);
      };

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      formResult.submit();
    });
  });
};

window.addEventListener("load", pay);