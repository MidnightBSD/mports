PORTNAME=	mdocml
PORTVERSION=	1.14.5
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

EXAMPLESDIR=	${PREFIX}/share/examples/mandoc

HAS_CONFIGURE=	yes
CFLAGS+=	-I${LOCALBASE}/include -fcommon  # clang11/gcc10
LDFLAGS+=	-L${LOCALBASE}/lib

post-configure:
	@${REINPLACE_CMD} -e '/^CFLAGS/s/=/?=/' -e '/^PREFIX/s/=/?=/' \
		-e 's/^INSTALL_PROGRAM.*/INSTALL_PROGRAM=${INSTALL_PROGRAM}/' \
		${WRKSRC}/Makefile.local

.include <bsd.port.mk>
