---
title: Bible projector w/ fhl.net
header-includes: |
    <!-- For fhl xml -->
    <style>
        engs, status, record_count, v_name, version, prev, next{
            visibility: hidden;
        }
        chineses::before {
            content: '\A';
            white-space: pre;
        }
        sec::before {
            content: ':';
        }
    </style>
...

<!-- https://stackoverflow.com/a/4033310/5769446 -->
<script type="text/JavaScript">
    function showBible(){
        var xmlHttp = new XMLHttpRequest();
        var ref = document.getElementById("bible-ref").value;
        const url='https://api.esv.org/v3/passage/html/?q=' + ref;
        xmlHttp.open( "GET", url, false ); // false for synchronous request
        xmlHttp.setRequestHeader('Authorization', 'Token 448c252493e8d8edc58a2538f297db52b772963f');
        xmlHttp.send( null );
        display_bible.innerHTML=  JSON.parse(xmlHttp.responseText).passages;
    }
    function showBibleFHL(){
        var xmlHttp = new XMLHttpRequest();
        var ref = document.getElementById("bible-ref-fhl").value;
        const url='https://bible.fhl.net/ajax/qb.php?chineses=' + ref.slice(0, 1) + '&chap=' + ref.slice(1);
        xmlHttp.open( "GET", url, false ); // false for synchronous request
        xmlHttp.send( null );
        display_bible_fhl.innerHTML = xmlHttp.responseText;
    }
</script>

:::::::::::::: {.columns}
::: {.column width="50%"}
<input type="text" placeholder="Enter Bible reference&hellip;" name="search" id="bible-ref">
<button type="button" onclick="showBible()" id="bible-click"><i class="fa fa-search"></i></button>

[]{#display_bible}
:::
::: {.column width="50%"}
<input type="text" placeholder="Enter Bible reference&hellip;" name="search" id="bible-ref-fhl">
<button type="button" onclick="showBibleFHL()" id="bible-click-fhl"><i class="fa fa-search"></i></button>

[]{#display_bible_fhl}
:::
::::::::::::::

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
    var input = document.getElementById("bible-ref-fhl");
    input.addEventListener("keyup", function(event) {
            if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("bible-click-fhl").click();
            }
        }
    );
</script>
