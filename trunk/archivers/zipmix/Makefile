# $MidnightBSD: mports/archivers/zipmix/Makefile,v 1.2 2009/12/25 17:58:27 laffer1 Exp $

PORTNAME=	zipmix
DISTVERSION=	20070221
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	http://www.advsys.net/ken/util/
DISTNAME=	${PORTNAME}_src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Produce a .ZIP file from 2 other ones with the best compressed files
LICENSE=	unknown

MAKE_JOBS_SAFE=	yes
USE_DOS2UNIX=	yes
USE_ZIP=	yes
NO_WRKSUBDIR=	yes

PLIST_FILES=	bin/${PORTNAME}

pre-build:
	@${CP} ${FILESDIR}/${MAKEFILE} ${WRKSRC}

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
