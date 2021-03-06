#!/bin/bash

cd caffeine@patapon.info

pot=gnome-shell-extension-caffeine.pot

xgettext -j *.js -o $pot

for locale_lang in locale/*; do
    po=$locale_lang/LC_MESSAGES/gnome-shell-extension-caffeine.po
    echo $po
    msgmerge --backup=off -U $po $pot
    msgfmt $po -o ${po%po}mo
done

rm $pot
