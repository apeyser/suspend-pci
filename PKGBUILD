# Maintainer: Alex Peyser <peyser.alex.public@gmail.com>
pkgname=suspend-pci
pkgver=1
pkgrel=9
pkgdesc="Remove pci devices before suspend"
arch=('any')
url=""
license=('BSD')
depends=('bash' 'pciutils' 'grep' 'coreutils')
makedepends=()
source=(suspend-pci.sh suspend-pci.conf)
backup=(etc/suspend-pci.conf)
sha256sums=('836e298be629645b415b92518de23ccc017d0600530133385f0730f1d0e1792d'
            '6eba84d44578b4e9c18b91d31cb469f815e330347901e36eb12b094f73532173')

build() {
    cp suspend-pci.sh suspend-pci
}

package() {
    install -p -m 0755 -D -t "$pkgdir/usr/lib/systemd/system-sleep" suspend-pci
    install -p -m 0644 -D -t "$pkgdir/etc" suspend-pci.conf
}
