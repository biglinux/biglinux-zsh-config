# Maintainer: Tales A. Mendonça talesam@gmail.com
# Developer: pheiduck @forum.biglinux.org

pkgname=biglinux-zsh-config
pkgver=$(date +%y.%m.%d)
pkgrel=$(date +%H%M)
pkgdesc="Zsh configuration for biglinux"
arch=(any)
url="https://github.com/biglinux/$pkgname"
license=('MIT')
conflicts=('grml-zsh-config' 'manjaro-zsh-config')
depends=('zsh-autosuggestions'
	'zsh-syntax-highlighting'
	'zsh-completions'
	'zsh-history-substring-search'
	'zsh'
	'pkgfile'
	'ttf-meslo-nerd-font-powerlevel10k'
	'ttf-nerd-fonts-symbols-with-biglinux'
	'zsh-theme-powerlevel10k')
source=("git+${url}.git") 
install=biglinux-zsh-config.install
sha256sums=('SKIP')
backup=(root/.zshrc)

package() {
	cd ${srcdir}
	install -D -m644 $srcdir/$pkgname/.zshrc ${pkgdir}/etc/skel/.zshrc
	install -D -m644 $srcdir/$pkgname/biglinux-zsh-config ${pkgdir}/usr/share/zsh/biglinux-zsh-config
	install -D -m644 $srcdir/$pkgname/biglinux-zsh-prompt ${pkgdir}/usr/share/zsh/biglinux-zsh-prompt
	install -D -m644 $srcdir/$pkgname/zsh-maia-prompt ${pkgdir}/usr/share/zsh/zsh-maia-prompt
	install -D -m644 $srcdir/$pkgname/p10k.zsh ${pkgdir}/usr/share/zsh/p10k.zsh
	install -D -m644 $srcdir/$pkgname/p10k-portable.zsh ${pkgdir}/usr/share/zsh/p10k-portable.zsh
	install -D -m644 $srcdir/$pkgname/command-not-found.zsh ${pkgdir}/usr/share/zsh/functions/command-not-found.zsh
	install -D -m640 $srcdir/$pkgname/rootzshrc ${pkgdir}/root/.zshrc
	chmod 750 ${pkgdir}/root
	mkdir -p $pkgdir/usr/share/zsh/scripts
	cp -r $srcdir/$pkgname/base16-shell $pkgdir/usr/share/zsh/scripts
	chmod a+x $pkgdir/usr/share/zsh/scripts/base16-shell/*
}
