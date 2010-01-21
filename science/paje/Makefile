# $MidnightBSD$

PORTNAME=	paje
PORTVERSION=	1.97
CATEGORIES=	science gnustep
MASTER_SITES=	http://download.forge.objectweb.org/paje/ \
		http://download.zh.forge.objectweb.org/paje/
DISTNAME=	Paje_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic visualization tool for GNUstep (Gantt chart and more)
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_LOCAL_ROOT}

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DOMAIN|#GNUSTEP_INSTALLATION_DOMAIN|' \
                ${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
