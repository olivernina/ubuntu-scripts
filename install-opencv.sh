sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove


# INSTALL THE DEPENDENCIES

# Build tools:
sudo apt-get install -y build-essential cmake

# GUI:
sudo apt-get install -y qt5-default libvtk6-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

#opencv dependencies - Some of these might be duplicate, needs clean up
sudo apt-get build-dep opencv

sudo apt-get -y install libopencv-dev build-essential cmake git libgtk2.0-dev pkg-config python-dev python-numpy libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff4-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip



# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
sudo apt-get install -y ant default-jdk

# Documentation:
sudo apt-get install -y doxygen


# INSTALL THE LIBRARY (opencv 2.4.10 is best for caffe)

sudo apt-get install -y unzip wget
wget https://github.com/Itseez/opencv/archive/2.4.10.zip
unzip 2.4.10.zip
rm 2.4.10.zip
mv opencv-2.4.10 OpenCV
cd OpenCV
mkdir build
cd build
cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DWITH_FFMPEG=OFF -DCUDA_GENERATION=Auto -DBUILD_TIFF=ON -DWITH_V4L=ON ..
make -j $(nproc)
sudo make install
sudo ldconfig


#in case you need dependencies for codecs you can look at manually installing ffmpeg
#I just didn't need it and didn't have time to try it with ffmpeg
### Install x264
#wget ftp://ftp.videolan.org/pub/videolan/x264/snapshots/x264-snapshot-20120528-2245-stable.tar.bz2

#tar xvf x264-snapshot-20120528-2245-stable.tar.bz2

#cd x264-snapshot-20120528-2245-stable

#./configure --enable-shared --enable-pic

#make

#sudo make install

###FFMPEG

#wget http://ffmpeg.org/releases/ffmpeg-snapshot-git.tar.bz2
#tar xvf ffmpeg-snapshot-git.tar.bz2
#cd ffmpeg

#./configure --enable-gpl --enable-libfaac --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libtheora --enable-libvorbis --enable-libx264 --enable-libxvid --enable-nonfree --enable-postproc --enable-version3 --enable-x11grab --enable-shared --enable-pic

#make 
#sudo make install

## V4l (video for linux)

#wget http://www.linuxtv.org/downloads/v4l-utils/v4l-utils-1.8.1.tar.bz2

#tar xvf v4l-utils-1.8.1.tar.bz2
#cd v4l-utils-1.8.1
#./bootstrap.sh 
#./configure
#make
#sudo make install






