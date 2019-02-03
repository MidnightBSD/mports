# $FreeBSD: head/sysutils/zrep/Makefile 338574 2014-01-03 19:28:01Z vg $

PORTNAME=	zrep
PORTVERSION=	1.0.1
CATEGORIES=	sysutils
MASTER_SITES=	http://www.bolthole.com/solaris/zrep/ \
		http://www.bsdstore.ru/downloads/
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ZFS based replication and failover solution

LICENSE=	unknown

PLIST_FILES=	bin/zrep

NO_BUILD=	yes

.include <bsd.mport.options.mk>

do-extract:
	@${MKDIR} ${WRKSRC}
	@${CP} -p ${DISTDIR}/${PORTNAME} ${WRKSRC}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
