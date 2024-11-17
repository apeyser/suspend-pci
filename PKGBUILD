# Maintainer: Alex Peyser <peyser.alex.public@gmail.com>
pkgname=suspend-pci
pkgver=1
pkgrel=8
pkgdesc="Remove pci devices before suspend"
arch=('any')
url=""
license=('BSD')
depends=('bash' 'pciutils' 'grep' 'coreutils')
makedepends=()
source=(suspend-pci.sh suspend-pci.conf)
backup=(etc/suspend-pci.conf)
sha256sums=('aaa5c514e61ecaa73465c1146c0cb6b502c6c5cf3debe85f32cb2c553895244c'
            '6eba84d44578b4e9c18b91d31cb469f815e330347901e36eb12b094f73532173')

build() {
    cp suspend-pci.sh suspend-pci
}

package() {
    install -p -m 0755 -D -t "$pkgdir/usr/lib/systemd/system-sleep" suspend-pci
    install -p -m 0644 -D -t "$pkgdir/etc" suspend-pci.conf
}
