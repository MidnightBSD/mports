PORTNAME=	qt5
PORTVERSION=	5.15.9
DISTVERSIONSUFFIX=	-1.el9
PORTREVISION=	2
CATEGORIES=	graphics linux
PKGNAMESUFFIX=	-qtwayland

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform application and UI framework, ${PKGNAMESUFFIX:S/-qt//g} (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://www.qt.io/

LICENSE=	gpl2+

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	cups-libs dbuslibs dri imageformats-libs libxml2 qtbase xorglibs wayland
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}
SRC_DISTFILES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}${SRC_SUFX}:SOURCE

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/devel/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
