# $MidnightBSD$

PORTNAME=	nettle
PORTVERSION=	2.6
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNU} \
		http://www.lysator.liu.se/~nisse/archive/:liu \
		ftp://ftp.lysator.liu.se/pub/security/lsh/:liu
MASTER_SITE_SUBDIR=	${PORTNAME}/:DEFAULT

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A low-level cryptographic library
LICENSE=	lgpl2.1

LIB_DEPENDS=	gmp:${PORTSDIR}/math/gmp

USE_GMAKE=	yes
USE_OPENSSL=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	M4="/usr/bin/m4 -g"
CONFIGURE_ARGS=	--enable-shared
MAKE_ARGS=	pkgconfigdir="${PREFIX}/libdata/pkgconfig"

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_LDCONFIG=	yes

DOCS=		NEWS README TODO nettle.html nettle.pdf
EXAMPLES=	examples/*.c examples/*.h

INFO=		nettle

.include <bsd.port.pre.mk>

.if ${ARCH} == "sparc64"
CONFIGURE_ENV+=	CCPIC=-fPIC
.endif

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${EXAMPLES} ${EXAMPLESDIR}
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}

.include <bsd.port.post.mk>
