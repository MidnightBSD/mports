PORTNAME=	libev
DISTVERSION=	4.33
CATEGORIES=	devel
MASTER_SITES=	http://dist.schmorp.de/libev/ \
		http://dist.schmorp.de/libev/Attic/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Full-featured and high-performance event loop library
WWW=		http://software.schmorp.de/pkg/libev.html

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-static
INSTALL_TARGET=	install-strip
USES=		libtool pkgconfig
USE_LDCONFIG=	yes

PKGCONFIGDIR?=	${PREFIX}/libdata/pkgconfig

post-patch:
	@${SED} -e 's|%PREFIX%|${PREFIX}|g ; s|%VERSION%|${PORTVERSION}|g' \
		${FILESDIR}/libev.pc.in > ${WRKDIR}/libev.pc

post-install:
	@${INSTALL_DATA} ${WRKDIR}/libev.pc ${PKGCONFIGDIR}/

.include <bsd.port.mk>
