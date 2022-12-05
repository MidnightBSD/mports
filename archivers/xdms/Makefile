PORTNAME=	xdms
PORTVERSION=	1.3.2
CATEGORIES=	archivers
MASTER_SITES=	http://zakalwe.fi/~shd/foss/xdms/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for decompressing Amiga DMS files
WWW=		https://zakalwe.fi/~shd/foss/xdms/

LICENSE=	publicdom
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:bzip2
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX}
ALL_TARGET=	xdms

USE_CSTD=	gnu89

PORTDOCS=	xdms.txt
PLIST_FILES=	bin/xdms

OPTIONS_DEFINE=	DOCS

post-patch:
	${REINPLACE_CMD} "s@-O2 -Wall@$${CFLAGS} -Wall@g" ${WRKSRC}/src/Makefile.in

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/xdms ${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/xdms.txt ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
