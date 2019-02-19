# $MidnightBSD$

PORTNAME=	mdnsd
DISTVERSIONPREFIX=	v
DISTVERSION=	0.7G-107
DISTVERSIONSUFFIX=	-gf4aee59
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	dns

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Advertise a service via Rendezvous

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BROKEN_powerpc64=	fails to compile: unrecognized command line option "-Wpedantic"

USES=		cmake:outsource
USE_GITHUB=	yes
GH_ACCOUNT=	Pro
USE_LDCONFIG=	yes

PLIST_FILES=	bin/mdnsd bin/mquery lib/liblibmdnsd.so

do-install:
	cd ${CONFIGURE_WRKSRC} && ${INSTALL_PROGRAM} mdnsd mquery \
		${STAGEDIR}${PREFIX}/bin
	${INSTALL_LIB} ${CONFIGURE_WRKSRC}/libmdnsd/liblibmdnsd.so \
		${STAGEDIR}${PREFIX}/lib

.include <bsd.port.mk>
