#!/bin/bash

link=$1


tmp_folder()
{
mkdir /tmp/tmp_cj
}


web()
{
echo "<html>
	<head>
		<title>
			Clickjacking
		</title>
	</head>
	<body>
		<h1>
			Testing Website
		</h1>
		<iframe src="$link" width="960" height="540">
		</iframe>
	</body>
     </html>
" > /tmp/tmp_cj/cj.html
echo "Test page created."
}


tmp_delete()
{
echo "Removing temporary files."
rm -rf /tmp/tmp_cj
echo "Finished."
}


open_html()
{
echo "Opening test page in your default web browser."
xdg-open /tmp/tmp_cj/cj.html
}


save_html()
{
read -p "Do you want to save and exit? [y/n] >> " save
if [[ $save == y ]]; then
echo "Saving cj.html"
cp /tmp/tmp_cj/cj.html $PWD
tmp_delete
else
tmp_delete
fi
}


start()
{
if [[ -z ${link}  ]]; then
echo -e "Syntax error.\neg : $0 http://www.example.com/login"
else
tmp_folder
web
open_html
save_html
fi
}


start
