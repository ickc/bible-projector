---
title: Bible projector w/ fhl.net
...

<!-- https://stackoverflow.com/a/4033310/5769446 -->
<script type="text/JavaScript">
    function showBible(){
        var xmlHttp = new XMLHttpRequest();
        var ref = document.getElementById("bible-ref").value;
        const url='https://bible.fhl.net/ajax/qb.php?chineses=' + ref.slice(0, 1) + '&chap=' + ref.slice(1);
        xmlHttp.open( "GET", url, false ); // false for synchronous request
        xmlHttp.send( null );
        display_bible.innerHTML = xmlHttp.responseText;
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
