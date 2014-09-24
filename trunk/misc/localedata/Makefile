# $MidnightBSD$

PORTNAME=	localedata
PORTVERSION=	5.4
PORTREVISION=	1
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	sf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Legacy locale data for FreeBSD 6+
LICENSE=	unknown

USES=		tar:bzip2
NO_BUILD=	yes

TARGET_DIR=	${PREFIX}/share/compat

.include <bsd.port.pre.mk>

WRKSRC=		${WRKDIR}/${ARCH}

post-extract:
	cd ${WRKDIR}/ia64; ${MV} usr/share/locale .

do-install:
	@${MKDIR} ${TARGET_DIR}
	@${PAX} -rw -s,${WRKSRC},, ${WRKSRC}/locale ${TARGET_DIR}

.include <bsd.port.post.mk>
