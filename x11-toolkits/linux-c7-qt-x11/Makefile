PORTNAME=	qt
PORTVERSION=	4.8.7
DISTVERSIONSUFFIX=	-9.el7_9
PORTREVISION=	5
CATEGORIES=	x11-toolkits linux
PKGNAMESUFFIX=	-x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform application and UI framework (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://qt-project.org

USES=		cpe linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	alsalib dri fontconfig imageformats-libs qt xorglibs
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

CONFLICTS=	linux-c6-qt47-x11
DATADIR=	${PREFIX}/usr/share/${PORTNAME}4

post-patch:
	@${RM} -r ${WRKSRC}/usr/share/icons

.include <bsd.port.mk>
