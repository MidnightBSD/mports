# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	qt
PORTVERSION=	4.8.7
DISTVERSIONSUFFIX=	-9.el7_9
PORTREVISION=	4
CATEGORIES=	x11-toolkits linux
PKGNAMESUFFIX=	-x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform application and UI framework (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl2

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	alsalib dri fontconfig jpeg png qt tiff xorglibs
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

CONFLICTS=	linux-c6-qt47-x11-[0-9]*
DATADIR=	${PREFIX}/usr/share/${PORTNAME}4

post-patch:
	@${RM} -r ${WRKSRC}/usr/share/icons

.include <bsd.port.mk>
