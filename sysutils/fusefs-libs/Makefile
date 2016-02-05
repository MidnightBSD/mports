# $MidnightBSD$

PORTNAME=	fusefs
PORTVERSION=	2.9.5
CATEGORIES=	sysutils
PKGNAMESUFFIX=	-libs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FUSE allows filesystem implementation in userspace

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

OPTIONS_DEFINE=	DOCS

WRKSRC=		${WRKDIR}/libfuse-1ac9ca5

USE_GITHUB=	yes
GH_ACCOUNT=	libfuse
GH_PROJECT=	libfuse
GH_TAGNAME=	1ac9ca5

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MOUNT_FUSE_PATH=${PREFIX}/sbin
CONFIGURE_ARGS=	--prefix=${PREFIX} \
		--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
INSTALL_TARGET=	install-strip
USES=		iconv libtool autoreconf gettext-tools
USE_LDCONFIG=	yes

PORTDOCS=	*

pre-configure:
	${CP} ${LOCALBASE}/share/gettext/config.rpath ${WRKSRC}

post-install:
	${INSTALL_DATA} ${WRKSRC}/include/fuse_kernel.h ${STAGEDIR}${PREFIX}/include/fuse
	@${MKDIR} ${STAGEDIR}${DOCSDIR}/libs
	${INSTALL_DATA} ${WRKSRC}/doc/how-fuse-works ${WRKSRC}/doc/kernel.txt ${STAGEDIR}${DOCSDIR}/libs

.include <bsd.port.mk>
