@@ -1,14 +1,25 @@
    function grid() {
        function grid(arr) {
            var grid_html = "";
            for (var i=0;i<50;i++){
                for (var i=0;i<arr.length;i++){
                    grid_html+= "<div class=\"col-md-4\">\n" +
                        "                    <div class=\"item\">\n" +
                        "                        <img src=\"imgs/ngoctrinhmuonsinhcon1_swej.jpg\"/>\n" +
                        "                        <h2>Tiêu đề item</h2>\n" +
                        "                        <p class='price'>20.000đ</p>\n" +
                        "                        <img src=\""+arr[i].image+"\"/>\n" +
                        "                        <h2>"+arr[i].name+"</h2>\n" +
                        "                        <p class='price'>"+arr[i].price+"đ</p>\n" +
                        "                    </div>\n" +
                        "                </div>";
                }
                return grid_html;
            }
            document.getElementById("grid").innerHTML= grid();
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if(this.readyState == 4 && this.status == 200){
                    var rs = this.responseText; // string ket qua tra ve
                    rs = JSON.parse(rs); // bien string thanh JSON
                    var menu = rs.data;
                    console.log(menu);
                    document.getElementById("grid").innerHTML= grid(menu);
                }
            }
            xhttp.open("GET","https://foodgroup.herokuapp.com/api/today-special");
            xhttp.send();