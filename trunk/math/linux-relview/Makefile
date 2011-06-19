# $MidnightBSD$
# $FreeBSD: ports/math/linux-relview/Makefile,v 1.10 2010/03/08 16:53:01 miwi Exp $

PORTNAME=	relview
PORTVERSION=	7.0.2
CATEGORIES=	math linux
MASTER_SITES=	ftp://ftp.informatik.uni-kiel.de/pub/kiel/relview/RELVIEW_7.0/LINUX/
PKGNAMEPREFIX=	linux-
EXTRACT_SUFX=	.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An interactive tool for manipulation of relations
LICENSE=	unknown

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX=	yes
USE_LINUX_APPS=	gtk xorglibs

NO_WRKSUBDIR=	yes
EXTRACT_AFTER_ARGS=	> ${DISTNAME}

NO_BUILD=	yes

PLIST_SUB=	VERSION=${PORTVERSION}

do-install:
	${BRANDELF} -t Linux ${WRKDIR}/${DISTNAME}
	${INSTALL_PROGRAM} ${WRKDIR}/${DISTNAME} ${PREFIX}/bin
	${LN} -fhs ${PREFIX}/bin/${DISTNAME} ${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
