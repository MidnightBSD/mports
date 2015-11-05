# Created by: Mikhail Teterin <mi@aldan.algebra.com>
# $FreeBSD: head/devel/jech-dht/Makefile 352975 2014-05-05 01:48:38Z mi $
# $MidnightBSD$

PORTNAME=	dht
PORTVERSION=	0.22
CATEGORIES=	devel
MASTER_SITES=	http://www.pps.univ-paris-diderot.fr/~jch/software/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mainline variant of Kademlia Distributed Hash Table (DHT)

LICENSE=	mit

FAKE_OPTS=	trueprefix

MAKEFILE=	${FILESDIR}/BSDmakefile
USE_LDCONFIG=	yes
USES=	uidfix

post-build:
	${SETENV} ${MAKE_ENV} ${MAKE} -C ${WRKSRC} -f \
		${FILESDIR}/Makefile.example
post-install:
	${SETENV} ${MAKE_ENV} ${MAKE} -C ${WRKSRC} -f \
		${FILESDIR}/Makefile.example install

pre-su-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/include/dht

.include <bsd.port.mk>
