#!/bin/bash
# Patches pidi-display-pil for Pillow 10+ compatibility
# getsize() was removed - replaced with getbbox()
PIDI_FILE=$(find /home/pi/.virtualenvs/mopidy/lib -name "__init__.py" -path "*/pidi_display_pil/*")

if [ -z "$PIDI_FILE" ]; then
    echo "Could not find pidi_display_pil/__init__.py"
    exit 1
fi

echo "Patching $PIDI_FILE"
sed -i 's/font\.getsize(\(.*\))\[0\]/font.getbbox(\1)[2]/g' "$PIDI_FILE"
echo "Done. Verify:"
grep -n "getsize\|getbbox" "$PIDI_FILE"
