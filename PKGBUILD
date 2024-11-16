# Maintainer: Alex Peyser <peyser.alex.public@gmail.com>
pkgname=suspend-pci
pkgver=1
pkgrel=2
pkgdesc="Remove pci devices before suspend"
arch=('any')
url=""
license=('BSD')
depends=()
makedepends=()
source=(suspend-pci.sh suspend-pci.conf)
sha256sums=('9d38390048f96ca680b80af7dda10880ca5670fd40481af9fd218f1d1175e51d'
            'e9ff84f422b0fef8931943a0e86827cf0d408ca4c6e93998508c682bb3eebf21')

package() {
    install -p -m 0755 -D -t "$pkgdir/usr/lib/systemd/system-sleep" suspend-pci.sh
    install -p -m 0644 -D -t "$pkgdir/etc" suspend-pci.conf
}
