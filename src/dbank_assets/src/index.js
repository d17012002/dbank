import { dbank } from "../../declarations/dbank";

window.addEventListener("load",async function (){
    await update();
})

document.querySelector("form").addEventListener("submit", async function(){
    event.preventDefault();

    const button = event.target.querySelector(".btn");
    button.setAttribute("disabled",true);

    const depositAmount = parseFloat(document.querySelector("#deposit").value);
    const withdrawAmount = parseFloat(document.querySelector("#withdraw").value);

    if(document.querySelector("#deposit").value.length != 0){
        await dbank.topUp(depositAmount);
        document.querySelector("#deposit").value = "";
    }

    if(document.querySelector("#withdraw").value.length != 0){
        await dbank.withdraw(withdrawAmount);
        document.querySelector("#withdraw").value = "";
    }

    await dbank.compound();
    await update();
    button.removeAttribute("disabled");
})

async function update(){
    const currentAmount = await dbank.checkBalance();
    document.querySelector("#amount").innerText = Math.round(currentAmount*100)/100;
}