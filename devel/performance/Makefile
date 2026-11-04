PORTNAME=	performance
PORTVERSION=	0.6.0
CATEGORIES=	devel gnustep
MASTER_SITES=	GNUSTEP/libs
DISTNAME=	Performance-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Help improve the performance of GNUstep applications

LICENSE=	lgpl3

USES=		gnustep
USE_GNUSTEP=	base build
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

post-install:
	(cd ${WRKSRC}; . ${GNUSTEP_MAKEFILES}/GNUstep.sh; \
                ${SETENV} ${MAKE_ENV} ${GMAKE} -d ${MAKE_FLAGS} ${MAKEFILE} ${FAKE_MAKEARGS} ${INSTALL_TARGET})


.include <bsd.port.mk>
