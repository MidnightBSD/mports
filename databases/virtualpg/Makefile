PORTNAME=	virtualpg
PORTVERSION=	2.0.1
CATEGORIES=	databases
MASTER_SITES=	http://www.gaia-gis.it/gaia-sins/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Loadable dynamic extension to both SQLite and SpatiaLite
WWW=		https://www.gaia-gis.it/fossil/virtualpg/index

LICENSE=	mpl lgpl2.1 gpl2
LICENSE_COMB=	dual
LICENSE_FILE_mpl=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
USES=		gmake iconv pathfix pkgconfig libtool pgsql sqlite
USE_LDCONFIG=	yes

CFLAGS+=	-I${WRKSRC}/src/headers -I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib ${ICONV_LIB}
CONFIGURE_ARGS+=	CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"

post-install:
	${STRIP_CMD} ${PREFIX}/lib/libvirtualpg.so.0.1.1
	${STRIP_CMD} ${PREFIX}/lib/mod_virtualpg.so.0.1.1

.include <bsd.port.mk>
