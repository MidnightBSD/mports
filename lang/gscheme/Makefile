# $MidnightBSD$

PORTNAME=	gscheme
PORTVERSION=	0.6
CATEGORIES=	lang gnustep
MASTER_SITES=	http://www.gnustep.it/marko/GScheme/ \
		FREEBSD_LOCAL/dinoex
DISTNAME=	GScheme
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	repacked

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep-aware scheme interpreter

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

post-extract:
	@${CHMOD} -R u+w ${WRKSRC}

post-patch:
	@${REINPLACE_CMD} -e 's|setMark:|setMarkScheme:|' \
		${WRKSRC}/SchemeTypes.h ${WRKSRC}/SchemeTypes.m

post-install:
	${RM} -f ${GNUSTEP_PREFIX}/Local/Applications/GScheme.app/Resources/library.scm~

.include <bsd.port.mk>
