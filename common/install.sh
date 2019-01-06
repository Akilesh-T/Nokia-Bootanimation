MODEL=`getprop ro.product.model`
RELEASE=`getprop ro.build.version.release`
BRAND=`getprop ro.product.brand`
DEVICE=`getprop ro.product.device`

ui_print " "
ui_print "  Performing device compatibility check..."
ui_print " "
ui_print "  Brand           : "$BRAND
echo     "  Model           : $MODEL"
ui_print "  Codename        : "$DEVICE
ui_print "  Android version : "$RELEASE
ui_print " "

if [ $BRAND != "Nokia" ]; then
	abort "  => Brand '"$BRAND"' is not supported"
fi

if [ $RELEASE != "8.1.0" ] && [ $RELEASE != "9" ]; then
	abort "  => Android version '"$RELEASE"' is not supported"
fi

BA=$INSTALLER/common/bootanimation.zip

if [ $RELEASE == "8.1.0" ]; then
  mkdir -p $INSTALLER/system/CDA/600ID/Power-on-animation
  mkdir -p $INSTALLER/system/CDA/600WW/Power-on-animation
  cp -rf $BA $INSTALLER/system/CDA/600ID/Power-on-animation/bootanimation.zip
  cp -rf $BA $INSTALLER/system/CDA/600WW/Power-on-animation/bootanimation.zip
fi


if [ $RELEASE == "9" ]; then
  mkdir -p $INSTALLER/system/product/media
  cp -rf $BA $INSTALLER/system/product/media/bootanimation.zip
fi  
  
ui_print "  Bootanimation was changed successfully!"  
