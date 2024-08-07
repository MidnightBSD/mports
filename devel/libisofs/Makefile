PORTNAME=	libisofs
PORTVERSION=	1.5.6
CATEGORIES=	devel
MASTER_SITES=	http://files.libburnia-project.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libburnia ISO9660 filesystem creation library
WWW=		https://dev.lovelyhq.com/libburnia/web/wiki/Libisofs

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libburn.so:devel/libburn

USES=		iconv libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

PORTDOCS=	Tutorial susp_* zisofs_format.txt

OPTIONS_DEFINE=		DEBUG DOCS LIBACL LIBJTE XATTR ZLIB
OPTIONS_DEFAULT=	LIBACL LIBJTE XATTR ZLIB

LIBACL_DESC=	Enable use of ACL functions
LIBJTE_DESC=	Jigdo file support
XATTR_DESC=	Extended file attribute support

DEBUG_CONFIGURE_ENABLE=		debug
LIBACL_CONFIGURE_ENABLE=	libacl
LIBJTE_CONFIGURE_ENABLE=	libjte
XATTR_CONFIGURE_ENABLE=		xattr
ZLIB_CONFIGURE_ENABLE=		zlib

post-patch:
	@${REINPLACE_CMD} 's/-liconv/${ICONV_LIB}/' ${WRKSRC}/configure

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/doc/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
