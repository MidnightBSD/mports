PORTNAME=	fdk-aac
DISTVERSION=	2.0.3
CATEGORIES=	audio
MASTER_SITES=	SF/opencore-amr/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Port of the Fraunhofer FDK AAC Codec Library
WWW=		https://sourceforge.net/projects/opencore-amr/

LICENSE=	FRAUNHOFER_FDK_AAC
LICENSE_NAME=	Software License for The Fraunhofer FDK AAC Codec Library for Android
LICENSE_FILE=	${WRKSRC}/NOTICE
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

NOT_FOR_ARCHS=		sparc64
NOT_FOR_ARCHS_REASON=	not yet ported to this architecture

USES=		cmake
USE_LDCONFIG=	yes

PLIST_SUB=	VER=${PORTVERSION}

.include <bsd.port.mk>
