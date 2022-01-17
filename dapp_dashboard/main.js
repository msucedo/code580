console.log("hello world");
// connect to moralis server
const serverUrl = "https://xbrpjuhfzdhe.usemoralis.com:2053/server";
const appId = "XpzNHSyQPmKayaqep2NOv1I6rQLvPwLSBJI4X0rd";
Moralis.start({ serverUrl, appId });

// login
login = async () => {
    await Moralis.authenticate().then(function (user) {
        console.log("logged in");
        console.log(user.get('ethAddress'));
        console.log(Moralis.User.current());
    })
    sendETH();
}

// sending 0.5 ETH
sendETH = async () => {
    const options = {type: "native", amount: Moralis.Units.ETH("50"), receiver: "0x0D41A7599728Fff0b3b5199462109ABF13eC7850"}
    let result = await Moralis.transfer(options)
}

document.querySelector('#btn-login').onclick = login;