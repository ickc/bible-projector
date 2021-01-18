---
title: Bible projector w/ Biblia
...

<!-- https://stackoverflow.com/a/4033310/5769446 -->
<script type="text/JavaScript">
    function showBible(){
        var xmlHttp = new XMLHttpRequest();
        var ref = document.getElementById("bible-ref").value;
        const url='https://api.biblia.com/v1/bible/content/LEB.html?passage=' + ref + '&key=22861ca17daee0828ae44544435e9149';
        xmlHttp.open( "GET", url, false ); // false for synchronous request
        xmlHttp.send( null );
        display_bible.innerHTML=  xmlHttp.responseText;
    }
</script>

<input type="text" placeholder="Enter Bible reference&hellip;" name="search" id="bible-ref">
<button type="button" onclick="showBible()" id="bible-click"><i class="fa fa-search"></i></button>

[]{#display_bible}

<!-- https://www.w3schools.com/howto/howto_js_trigger_button_enter.asp -->
<script type="text/JavaScript">
    var input = document.getElementById("bible-ref");
    input.addEventListener("keyup", function(event) {
            if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("bible-click").click();
            }
        }
    );
</script>
