#!/bin/bash
TargetPath=/usr/share/remarkable/templates
SourcePath=/home/root/custom

# save default json file and create symlink to custom json
mv $TargetPath/templates.json $TargetPath/templates_default.json
ln -s $SourcePath/templates_custom.json $TargetPath/templates.json

png_template() {
	ln -s $SourcePath/$1.png $TargetPath/$1.png
}

svg_template() {
	ln -s $SourcePath/$1.svg $TargetPath/$1.svg
}

dual_template() {
	png_template $1
	svg_template $1
}

# create custom templates via symlink
png_template dnd-5e-character-sheet
png_template vtm-character-sheet
png_template wta-ananasi-sheet
png_template wfb-main

systemctl restart xochitl
