# Maintainer: udeved <udeved@openrc4arch.site40.net>

pkgname=kde-servicemenus-pkg-tools-git
pkgver=0.r6.d40a0bb
pkgrel=1
pkgdesc="Kde servicemenu for makepkg, repo-add & repo-remove, anmcap & aur upload."
arch=('any')
url="https://github.com/udeved/kde-servicemenus-pacman-tools"
license=('GPL2')
depends=('kdebase-dolphin' 'pacman' 'namcap' 'curl')
makedepends=('git')
conflicts=('kde-servicemenus-pacman-tools')
install=pkg-tools.install
source=("$pkgname"::'git://github.com/udeved/kde-servicemenu-pacman-tools.git')
md5sums=('SKIP')

pkgver() {
      cd "$srcdir/$pkgname"
      printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
      cd "$pkgname"

      install -Dm755 bin/pacman-magic $pkgdir/usr/bin/pkg-magic

      install -Dm644  ServiceMenus/repo-magic.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/repo-magic.desktop
      install -Dm644  ServiceMenus/pkg-magic.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/pkg-magic.desktop
      #install -Dm644  ServiceMenus/pacman-magic.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/pacman-magic.desktop
      install -Dm644  ServiceMenus/namcap-magic.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/namcap-magic.desktop
      install -Dm644  ServiceMenus/aur-magic.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/aur-magic.desktop

      install -Dm644 mime/application/x-xz-pkg.xml $pkgdir/usr/share/mime/application/x-xz-pkg.xml
      install -Dm644 mime/application/x-pkgbuild.xml $pkgdir/usr/share/mime/application/x-pkgbuild.xml
      install -Dm644 mime/packages/application-x-xz-pkg.xml $pkgdir/usr/share/mime/packages/application-x-xz-pkg.xml
      install -Dm644 mime/packages/application-x-pkgbuild.xml $pkgdir/usr/share/mime/packages/application-x-pkgbuild.xml
      install -Dm644 mime/application/x-gz-src.xml $pkgdir/usr/share/mime/application/x-gz-src.xml
      install -Dm644 mime/packages/application-x-gz-src.xml $pkgdir/usr/share/mime/packages/application-x-gz-src.xml

}
