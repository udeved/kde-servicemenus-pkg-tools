# Maintainer: udeved <udeved@openrc4arch.site40.net>

pkgname=kde-servicemenus-pkg-tools-git
pkgver=0.r57.765c583
pkgrel=1
pkgdesc="Kde servicemenu for makepkg, repo-add & repo-remove, namcap & aur upload."
arch=('any')
url="https://github.com/udeved/kde-servicemenus-pkg-tools"
license=('GPL2')
depends=('kdebase-kdialog')
makedepends=('git')
conflicts=('kde-servicemenus-pkg-tools')
install=pkg-tools.install
source=("$pkgname"::'git://github.com/udeved/kde-servicemenu-pkg-tools.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"

	install -Dm755 bin/pkg-magic $pkgdir/usr/bin/pkg-magic

	for f in ServiceMenus/*;do
		install -Dm644  $f $pkgdir/usr/share/kde4/services/$f
	done

	for f in mime/application/*;do
		install -Dm644 $f $pkgdir/usr/share/$f
	done
	for f in mime/packages/*;do
		install -Dm644 $f $pkgdir/usr/share/$f
	done
}
