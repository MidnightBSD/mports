# $MidnightBSD: mports/misc/localedata/Makefile,v 1.3 2008/09/21 20:28:38 laffer1 Exp $

PORTNAME=	localedata
PORTVERSION=	5.4
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	sf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Legacy locale data for FreeBSD 6+
LICENSE=	unknown

USE_BZIP2=	yes
NO_BUILD=	yes

TARGET_DIR=	${PREFIX}/share/compat

.include <bsd.port.pre.mk>

WRKSRC=		${WRKDIR}/${ARCH}

post-extract:
	cd ${WRKDIR}/ia64; ${MV} usr/share/locale .

do-install:
	${MKDIR} ${TARGET_DIR}
	${PAX} -rw -s${WRKSRC} ${WRKSRC}/locale ${TARGET_DIR}

.include <bsd.port.post.mk>
