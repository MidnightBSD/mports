PORTNAME=	ucl
PORTVERSION=	1.03
PORTREVISION=	4
CATEGORIES=	archivers devel
MASTER_SITES=	http://www.oberhumer.com/opensource/ucl/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data compression library with low memory usage
WWW=		https://www.oberhumer.com/opensource/ucl/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

OPTIONS_DEFINE=	DOCS

USES=		libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared
INSTALL_TARGET=	install-strip

CONFLICTS_INSTALL=	libucl

PORTDOCS=	AUTHORS NEWS README THANKS TODO

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/examples/.libs/uclpack ${PREFIX}/bin
	cd ${PREFIX}/lib && ln -sf libucl.so.1.0.0 libucl.so
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA}	${PORTDOCS} ${DOCSDIR}

.include <bsd.port.mk>
