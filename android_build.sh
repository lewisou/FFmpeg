SCRATCH="build/android"
CWD=`pwd`

export PATH="$TOOLCHAIN/bin":$PATH
export PREFIX="$CWD/output_android/armeabi-v7a"

mkdir -p "$SCRATCH"
cd "$SCRATCH"

TMPDIR=${TMPDIR/%\/} $CWD/configure --enable-cross-compile \
                                    --arch=arm \
                                    --cpu=armv7-a \
                                    --target-os=android \
                                    --prefix=$PREFIX \
                                    --sysroot=$TOOLCHAIN/sysroot \
                                    --cross-prefix=arm-linux-androideabi- \
                                    --disable-everything \
                                    --enable-static \
                                    --enable-decoder=h264 \
                                    --enable-decoder=aac \
                                    --enable-parser=h264 \
                                    --enable-parser=aac \
                                    --enable-swscale \
                                    --enable-demuxer=rtp \
                                    --enable-demuxer=rtsp \
                                    --enable-encoder=aac \
                                    --enable-muxer=adts \
                                    --enable-protocol=tcp


make && make install
cd "$CWD"
