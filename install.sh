#!/bin/bash

# Only append if swerty is not already there
if grep -q swerty /usr/share/X11/xkb/symbols/se; then
	echo "There's already an entry for Swerty in in /usr/share/X11/xkb/symbols/se."
else
	cat ./se.txt >> /usr/share/X11/xkb/symbols/se
	echo "Added entry for Swerty in /usr/share/X11/xkb/symbols/se"
fi



grep -q swerty /usr/share/X11/xkb/rules/evdev.xml
if [ $? == 0 ] then
	echo "Swerty is already listed as a variant in /usr/share/X11/xkb/rules/evdev.xml."
else
	# Get line number of the line the Swedish language list is set
	lineNumberWithISO=$(grep -n 'swe</iso639Id>' '/usr/share/X11/xkb/rules/evdev.xml' | cut -f1 -d:)

	# Find the line offset for <variantList>
	variantListLineNumbers=$(grep -n 'variantList' '/usr/share/X11/xkb/rules/evdev.xml' | cut -f1 -d:)

	# Find first <variantList> line after the swedish language tags
	for num in $variantListLineNumbers; do
		if (( $num > $lineNumberWithISO )) then
			# Add swerty variant after <variantList> block
			sed -i "$num r ./variant.txt" /usr/share/X11/xkb/rules/evdev.xml
			echo "Added entry for Swerty in  /usr/share/X11/xkb/rules/evdev.xml."
			break
		fi
	done
fi




grep -q Swerty /usr/share/X11/xkb/rules/evdev.lst
if [ $? == 0 ] then
	echo "Swerty is already listed as a variant in /usr/share/X11/xkb/rules/evdev.lst."
else
	# Add variant to list in /usr/share/X11/xkb/rules/evdev.lst
	lineNumberWithFirstSE=$(grep -n se:\  /usr/share/X11/xkb/rules/evdev.lst | cut -f1 -d: | cut -d' ' -f1)
	firstNumber=$(echo $lineNumberWithFirstSE | cut -d' ' -f1)
	sed -i "$firstNumber r ./variant2.txt" /usr/share/X11/xkb/rules/evdev.lst

	echo "Added entry for Swerty in /usr/share/X11/xkb/rules.evdev.lst"
fi



echo "Swerty is now an alternative keyboard layout for Swedish"

