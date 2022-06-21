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
$(ali experience.html Experience)
$(ali contact.html Contact)

</ul>
</nav>

<main>
<article>
<div>
$(cat "$filename")
</div>
</article>
</main>

<footer>
<span>The sources for this garbage can be found <a href="https://github.com/sinf/portfolio-website-template">here</a></span>
</footer>

</body>
</html>
END

