# Created by: Alexey Dokuchaev <danfe@FreeBSD.org>

PORTNAME=	rhash
PORTVERSION=	1.3.9
CATEGORIES=	security
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

PATCH_SITES=	https://gitweb.gentoo.org/repo/gentoo.git/plain/app-crypt/rhash/files/:gentoo \
		https://raw.githubusercontent.com/gentoo/gentoo/master/app-crypt/rhash/files/:gentoo \
		https://sourceforge.net/p/rhash/patches/_discuss/thread/271b85e9/0ac7/attachment/:sf
PATCHFILES=	rhash-1.3.9-nls.patch:-p1:gentoo \
		rhash-1.3.9-rc-segfault.patch:-p1:gentoo \
		rhash-1.3.2.patch:-p1:sf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility and library for computing and checking of file hashes

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS+=   trueprefix

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix="${PREFIX}" --mandir="${PREFIX}/man" \
		--pkgconfigdir="${PREFIX}/libdata/pkgconfig" \
		--enable-lib-static --enable-openssl-runtime \
		--extra-cflags="${CFLAGS}" --extra-ldflags="${LDFLAGS}"
INSTALL_TARGET=	install install-lib-so-link install-pkg-config
USE_LDCONFIG=	yes

NO_TEST=	yes

WRKSRC=		${WRKDIR}/RHash-${PORTVERSION}

PORTDOCS=	ChangeLog README.md

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext localbase:ldflags
NLS_CONFIGURE_ON=	--enable-gettext
NLS_INSTALL_TARGET=	install-gmo

post-patch:
	@${REINPLACE_CMD} -e '/BYTE_ORDER/s,__,_,g' \
		${WRKSRC}/librhash/byte_order.h

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
