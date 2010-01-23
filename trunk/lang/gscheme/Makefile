# $MidnightBSD$

PORTNAME=	gscheme
PORTVERSION=	0.6
CATEGORIES=	lang gnustep
MASTER_SITES=	http://www.gnustep.it/marko/GScheme/
DISTNAME=	GScheme
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	repacked

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep-aware scheme interpreter
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${REINPLACE_CMD} -e 's|setMark:|setMarkScheme:|' \
		${WRKSRC}/SchemeTypes.h ${WRKSRC}/SchemeTypes.m

post-install:
	${RM} -f ${GNUSTEP_PREFIX}/Local/Applications/GScheme.app/Resources/library.scm~

.include <bsd.port.mk>
