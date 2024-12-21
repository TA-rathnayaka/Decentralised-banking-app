import { dBank } from "../../declarations/dBank";

window.addEventListener("load", async () => {
  await update();
});

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();

  const topUpAmount = parseFloat(document.getElementById("input-amount").value);
  const withDrawAmount = parseFloat(
    document.getElementById("withdrawal-amount").value
  );

  const button = e.target.querySelector("#submit-btn");
  button.setAttribute("disabled", true);
  if (!isNaN(topUpAmount) && topUpAmount > 0) {
    await dBank.topUp(topUpAmount);
  }
  if (!isNaN(withDrawAmount) && withDrawAmount > 0) {
    console.log(withDrawAmount);
    await dBank.withdraw(withDrawAmount);
  }
  await dBank.compound();
  await update();
  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";
  button.removeAttribute("disabled");
});

async function update() {
  const currentAmount = await dBank.checkBalance();
  document.getElementById("value").innerText = currentAmount.toFixed(2);
}
