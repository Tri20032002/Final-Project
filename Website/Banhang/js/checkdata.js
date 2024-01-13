function check() {
    var data = new Array();
    data[0] = document.getElementById('ten').value;
    data[1] = document.getElementById('email').value;
    data[1] = document.getElementById('std').value;
    data[2] = document.getElementById('matkhau').value;
    data[3] = document.getElementById('nlmatkhau').value;


    var myerror = new Array();
    myerror[0] = "<span style=’color:red,font-weight:bold’>You have not entered a name</span>";
    myerror[1] = "<span style=’color:red,font-weight:bold’>You have not entered your email yet</span>";
    myerror[2] = "<span style=’color:red,font-weight:bold’>You have not entered a password</span>";
    myerror[3] = "<span style=’color:red,font-weight:bold’>Password does not match</span>";


    var nearby = new Array("z-ten", "z-email", "z-std", "z-matkhau", "z-nlmatkhau");


    for (i in data) {
        var error = myerror[i];
        var div = nearby[i];        


        if (data[i]=="") {
            document.getElementById(div).innerHTML = error;
        } else {
            document.getElementById(div).innerHTML = "OK!";
        }
    }


}