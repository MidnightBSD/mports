PORTNAME=	zipper
PORTVERSION=	1.5
PORTREVISION=	3
CATEGORIES=	archivers gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	Zipper-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for inspecting the contents of a compressed archive
WWW=		http://gap.nongnu.org/zipper/

LICENSE=	publicdom

USES=		gnustep
USE_GNUSTEP=	back build

post-patch:
	cd ${WRKSRC} && ${FIND} . -name "*#*" -exec ${RM} -f -v "{}" ";"

.include <bsd.port.mk>
