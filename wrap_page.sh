#!/bin/bash
filename="$1"
get_var() ( grep "$1" "$filename" | cut -d= -f2)
ali() (
	if [ "$1" = ${filename#src/} ]; then u='#'; else u="$1"; fi
	echo "<li><a class=\"button\" href=\"$u\">$2</a></li>"
)

cat - <<END
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Web page - $(get_var title)</title>
<style>
body {
	background: #0A1930;
	color: #CAD7F7;
}
</style>
</head>
<link rel="stylesheet" href="styles.css" />
<body>

<nav id="topmenu">
<ul>
$(ali index.html About)
$(ali portfolio.html Portfolio)
$(ali contact.html Contact)

$(ali fail.html Experience)
$(ali fail.html Work)
$(ali fail.html Resume)

</ul>
</nav>

<main>
<article>
$(cat "$filename")
</article>
</main>

</body>
</html>
END

