# $MidnightBSD: mports/misc/gnustep-examples/Makefile,v 1.4 2008/06/07 21:28:27 laffer1 Exp $

PORTNAME=	gnustep-examples
PORTVERSION=	1.3.0
PORTREVISION=	0
CATEGORIES=	misc gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep example applications

LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GL=		yes

WRKSRC=		${WRKDIR}/${DISTNAME}
USE_GNUSTEP_MAKE_DIRS+=	. gui/Finger gui/GFractal gui/HostAddress gui/MyGL
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_LOCAL_ROOT}

post-patch:
	${REINPLACE_CMD} -e 's|^//|#|' \
		${WRKSRC}/gui/GFractal/GNUmakefile

.include <bsd.port.mk>
