#!/bin/sh
cat << EOF
<head>
<title>BUZZ</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
@import url(http://fonts.googleapis.com/css?family=Oswald);
body{
    font-family: "Helvetica Neue", Arial, Freesans, clean, sans-serif;
    font-size: 14px;
    font-weight:300;
    margin-left:7em;
    max-width:50em;
    background:#fffcf7;
    color:#333;
}

h2, h4, h5, h6 {
    font-weight: bold;
    margin: 2em 0px 15px 0px;
}

h1 {
    font-family: Oswald, "Helvetica Neue", Arial, sans-serif;
    color: #000;
    font-size: 8em;
    font-style: italic;
    text-shadow: -4px 0px 0px rgba(255, 0, 0, 1),
                  4px 0px 0px rgba(0, 255, 255, 1);
    margin: 0em;
}

h3 {
    margin: 0em;
    margin-left: 0.5em;
    font-size: 1.4em;
    text-transform: uppercase;
    font-style: italic;
    font-weight: 100;
    font-family: Oswald, "Helvetica Neue", Arial, sans-serif;
}
h2 {
    font-style: italic;
    font-size: 2em;
	text-transform: capitalize;
}

h2:hover {
    color: #ff0000;
    cursor: pointer;
}
a {
    color: #ff2222;
    text-decoration: none;
}


</style>
</head>

<h1>#TCDBUZZ</h1>
<h3 id="subtitle">Campus scandals worth sharing. Updated hourly.</h3>
<h3><a href='http://shawa.netsoc.ie/buzz/index.html'>CS</a>  &middot;
<a href='http://shawa.netsoc.ie/buzz/tp.html'>TP/Maths</a></h3>
EOF

./clickbait.py resources/"$1.json" 'resources/templates.json' 100 | sed 's,^,<h2>,; s,$,</h2>,'

cat <<EOF
<h5>Don't worry, it's not real. <a href="http://shawa.netsoc.ie">shawa</a></h5>
EOF
