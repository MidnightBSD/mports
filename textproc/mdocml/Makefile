PORTNAME=	mdocml
PORTVERSION=	1.14.6
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	http://mdocml.bsd.lv/snapshots/ \
		FREEBSD_LOCAL/uqs
DISTNAME=	mandoc-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	mdoc macro compiler
WWW=		https://mdocml.bsd.lv/

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libsqlite3.so:databases/sqlite3
RUN_DEPENDS=	${LOCALBASE}/lib/libsqlite3.so:databases/sqlite3

EXAMPLESDIR=	${PREFIX}/share/examples/mandoc

HAS_CONFIGURE=	yes
CFLAGS+=	-I${LOCALBASE}/include -fcommon  # clang11/gcc10
LDFLAGS+=	-L${LOCALBASE}/lib

post-configure:
	@${REINPLACE_CMD} -e '/^CFLAGS/s/=/?=/' -e '/^PREFIX/s/=/?=/' \
		-e 's/^INSTALL_PROGRAM.*/INSTALL_PROGRAM=${INSTALL_PROGRAM}/' \
		-e 's|/var/www|${WWWDIR}|' \
		${WRKSRC}/Makefile.local
	cp ${WRKSRC}/cgi.h.example ${WRKSRC}/cgi.h

post-build:
	cd ${WRKSRC} && ${MAKE} ${FAKE_MAKEARGS} man.cgi

post-install:
	cd ${WRKSRC} && ${MAKE} ${FAKE_MAKEARGS} cgi-install

.include <bsd.port.mk>
