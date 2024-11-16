# Maintainer: Alex Peyser <peyser.alex.public@gmail.com>
pkgname=suspend-pci
pkgver=1
pkgrel=5
pkgdesc="Remove pci devices before suspend"
arch=('any')
url=""
license=('BSD')
depends=()
makedepends=()
source=(suspend-pci.sh suspend-pci.conf)
backup=(etc/suspend-pci.conf)
sha256sums=('db743c5af316099803b9b1f93ee65441205cdf7832d66df7d563930c8ad5e745'
            'e9ff84f422b0fef8931943a0e86827cf0d408ca4c6e93998508c682bb3eebf21')

package() {
    install -p -m 0755 -D -t "$pkgdir/usr/lib/systemd/system-sleep" suspend-pci.sh
    install -p -m 0644 -D -t "$pkgdir/etc" suspend-pci.conf
}
