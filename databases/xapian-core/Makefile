PORTNAME=	xapian-core
PORTVERSION=	2.1.0
PORTEPOCH=	1
CATEGORIES=	databases
MASTER_SITES=	https://oligarchy.co.uk/xapian/${PORTVERSION}/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Probabilistic text search database engine
WWW=		https://xapian.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libicuuc.so:devel/icu

USES=		compiler:c++17-lang libtool tar:xz
USES+=	cpe
CPE_VENDOR=	xapian

CONFIGURE_ARGS=	ac_cv_func_snprintf=snprintf
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

# The upstream check suite reported failures on MidnightBSD 4.0.9.
NO_TEST=	yes
USE_CXXSTD=	c++17
USE_LDCONFIG=	yes

CONFLICTS_INSTALL=	xapian-core14 # include/xapian.h

PORTSCOUT=	limitw:1,even

OPTIONS_DEFINE=	DOCS SSE2
SSE2_DESC=	Use SSE2 for floating point

SSE2_CONFIGURE_ENABLE=	sse

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/xapian-inspect ${PREFIX}/bin/xapian-inspect

.include <bsd.port.mk>
