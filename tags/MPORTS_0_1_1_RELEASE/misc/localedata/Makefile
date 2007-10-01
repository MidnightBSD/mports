# New ports collection makefile for:	legacy locale data for FreeBSD 6+
# Date created:		13 Jun 2005
# Whom:			sf
#
# $MidnightBSD: mports/misc/localedata/Makefile,v 1.1 2006/09/17 07:14:46 archite Exp $
# $FreeBSD: ports/misc/localedata/Makefile,v 1.4 2006/05/29 13:13:37 clsung Exp $
#

PORTNAME=	localedata
PORTVERSION=	5.4
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	sf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Legacy locale data for FreeBSD 6+

USE_BZIP2=	yes
NO_BUILD=	yes

ONLY_FOR_ARCHS=	amd64 ia64 i386 pc98 sparc64

TARGET_DIR=	${PREFIX}/share/compat

.include <bsd.port.pre.mk>

WRKSRC=		${WRKDIR}/${ARCH}

post-extract:
	cd ${WRKDIR}/ia64; ${MV} usr/share/locale .

do-install:
	${MKDIR} ${TARGET_DIR}
	${PAX} -rw -s${WRKSRC} ${WRKSRC}/locale ${TARGET_DIR}

.include <bsd.port.post.mk>
