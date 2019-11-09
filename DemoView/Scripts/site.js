function login() {
    var user = $("#username").val();
    var pwd = $("#password").val();
    var data = {
        username: user,
        password: pwd
    }

    $.post("/User/Login",
        data,
        (res) => {
            if (res.Result === true) {
                window.location.href = "/Home/About";
            }
            else {
                alert("Login failed");
            }
        },
        "json"
    )
}