#!/bin/bash
filename="$1"
get_var() ( grep "$1" "$filename" | cut -d= -f2)
ali() (
	if [ "$1" = ${filename#src/} ]; then u='#'; else u="$1"; fi
	echo "<li><a href=\"$u\">$2</a></li>"
)

cat - <<END
<!DOCTYPE html>
<html lang="en">
<head>
<title>Arho Mahlamäki - $(get_var title)</title>
</head>
<body>

<nav>
$(ali index.html About)
$(ali portfolio.html Portfolio)
$(ali contact.html Contact)
</nav>

<main>
$(cat "$filename")
</main>

</body>
</html>
END

