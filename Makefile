V=0.9

PREFIX = /usr/local

BINPROGS = \
	bin/pkg-magic

MIMEAPP = \
	mime/application/x-gz-src.xml \
	mime/application/x-pkgbuild.xml \
	mime/application/x-xz-pkg.xml

MIMEPKG = \
	mime/packages/pkg-tools.xml

SERVICES = \
	ServiceMenus/aur-upload.desktop \
	ServiceMenus/makepkg.desktop \
	ServiceMenus/namcap.desktop \
	ServiceMenus/pactree.desktop \
	ServiceMenus/pkg-tools.desktop \
	ServiceMenus/repo-action.desktop

all: $(BINPROGS)

%: %.in Makefile
	@echo "GEN $@"
	@$(RM) "$@"
	@chmod a-w "$@"
	@chmod +x "$@"

clean:
	rm -f $(BINPROGS)

install:
	install -dm0755 $(DESTDIR)$(PREFIX)/bin
	install -m0755 ${BINPROGS} $(DESTDIR)$(PREFIX)/bin

	install -dm0755 $(DESTDIR)$(PREFIX)/share/mime/application
	install -m0644 ${MIMEAPP} $(DESTDIR)$(PREFIX)/share/mime/application

	install -dm0755 $(DESTDIR)$(PREFIX)/share/mime/packages
	install -m0644 ${MIMEPKG} $(DESTDIR)$(PREFIX)/share/mime/packages

	install -dm0755 $(DESTDIR)$(PREFIX)/share/kde4/services/ServiceMenus
	install -m0644 ${SERVICES} $(DESTDIR)$(PREFIX)/share/kde4/services/ServiceMenus


uninstall:
	for f in ${BINPROGS}; do rm -f $(DESTDIR)$(PREFIX)/bin/$$f; done
	for f in ${MIMEAPP}; do rm -f $(DESTDIR)$(PREFIX)/share/mime/application/$$f; done
	for f in ${MIMEPKG}; do rm -f $(DESTDIR)$(PREFIX)/share/mime/packages/$$f; done
	for f in ${SERVICES}; do rm -f $(DESTDIR)$(PREFIX)/share/kde4/services/ServiceMenus/$$f; done

dist:
	git archive --format=tar --prefix=kde-servicemenus-pkg-tools-$(V)/ $(V) | gzip -9 > kde-servicemenus-pkg-tools-$(V).tar.gz
	gpg --detach-sign --use-agent kde-servicemenus-pkg-tools-$(V).tar.gz

.PHONY: all clean install uninstall dist
