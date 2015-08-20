# $MidnightBSD$

PORTNAME=	toolbox
PORTVERSION=	0.8
PORTREVISION=	4
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://ftp.azc.uam.mx/mirrors/gnu/savannah/files/toolbox/Release.pkg/0.8/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
DISTNAME=	Toolbox-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of tools for GNUstep

LICENSE=	gpl2

USES=           gnustep
USE_GNUSTEP=    back build
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	Toolbox:${TOOLBOXKIT_PORT}

WRKSRC=		${WRKDIR}/Toolbox
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_LOCAL_ROOT}

TOOLBOXKIT_PORT?=	deskutils/toolboxkit

post-patch:
	${REINPLACE_CMD} -e 's| Toolbox ||' ${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
