V=0.9

PREFIX = /usr/local

BINPROGS = \
	bin/pkg-magic

MIMEAPP = \
	mime/application/x-pkgbuild.xml \
	mime/application/x-xz-pkg.xml

MIMEPKG = \
	mime/packages/pkg-tools.xml

SERVICES = \
	ServiceMenus/makepkg.desktop \
	ServiceMenus/namcap.desktop \
	ServiceMenus/pactree.desktop \
	ServiceMenus/repo-action.desktop

all: $(BINPROGS)

edit = sed -e "s|@version@|${V}|"

%: %.in Makefile
	@echo "GEN $@"
	@$(RM) "$@"
	@m4 -P $@.in | $(edit) >$@
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

	install -dm0755 $(DESTDIR)$(PREFIX)/share/kservices5/ServiceMenus
	install -m0644 ${SERVICES} $(DESTDIR)$(PREFIX)/share/kservices5/ServiceMenus


uninstall:
	for f in ${BINPROGS}; do rm -f $(DESTDIR)$(PREFIX)/bin/$$f; done
	for f in ${MIMEAPP}; do rm -f $(DESTDIR)$(PREFIX)/share/mime/application/$$f; done
	for f in ${MIMEPKG}; do rm -f $(DESTDIR)$(PREFIX)/share/mime/packages/$$f; done

	for f in ${SERVICES}; do rm -f $(DESTDIR)$(PREFIX)/share/kservices5/ServiceMenus/$$f; done

dist:
	git archive --format=tar --prefix=kde-servicemenus-pkg-tools-$(V)/ $(V) | gzip -9 > kde-servicemenus-pkg-tools-$(V).tar.gz
	gpg --detach-sign --use-agent kde-servicemenus-pkg-tools-$(V).tar.gz

.PHONY: all clean install uninstall dist
