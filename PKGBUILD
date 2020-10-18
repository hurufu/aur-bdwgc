# Maintainer: Aleksy Grabowski <hurufu@gmail.com>

pkgname=libbdwgc
pkgver=8.0.4
pkgrel=1
pkgdesc="Boehm-Demers-Weiser conservtive garbage collector (with debugging enabled)"
arch=('i686' 'x86_64')
url='https://www.hboehm.info/gc/'
license=('MIT')
makedepends=(
    make
)
provides=(
    gc
)
conflicts=(
    gc
)
source=("$url/gc_source/gc-${pkgver}.tar.gz")
md5sums=(67a5093e2f9f381bd550aa891d00b54b)
sha1sums=(4b8b24534f469b64ff4bc2332a9bdf8bef8bf1d4)

build() {
    cd "${srcdir}/gc-${pkgver}"
    ./autogen.sh
    ./configure \
        --prefix=/usr\
        --disable-gcj-support\
        --enable-gc-debug\
        --enable-gc-assertions
    make
}

package() {
    cd "${srcdir}/gc-${pkgver}"
    make DESTDIR=${pkgdir} install
}

check() {
    cd "${srcdir}/gc-${pkgver}"
    make check
}
