:<<EOF

EOF
sudo apt-get update
sudo apt-get install -y imagemagick --fix-missing
git clone https://github.com/KoreaHaos/haos_images.git
unzip haos_images/Photos.zip -d haos_images

mkdir haos_bash


mkdir haos_bash/haos_img_manip

cat > haos_bash/haos_img_manip/run_image_magick_tests.sh << EOF
# ImageMagick Tester!

convert haos_images/Mandelbrot_island.jpg haos_images/Mandelbrot_island.png

convert haos_images/Mandelbrot_island.jpg -colorspace gray \
    \( +clone -tile haos_images/pencil_tile.gif -draw "color 0,0 reset" \
    +clone +swap -compose color_dodge -composite \) \
    -fx 'u*.2+v*.8' haos_images/Mandelbrot_island_sketch.jpg
EOF

bash haos_bash/haos_img_manip/run_image_magick_tests.sh
