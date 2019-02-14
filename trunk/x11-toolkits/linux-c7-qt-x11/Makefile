# $MidnightBSD$

PORTNAME=	qt
PORTVERSION=	4.8.5
CATEGORIES=	x11-toolkits linux
PKGNAMESUFFIX=	-x11
LIB_DISTNAMES=	${LINUXNAME}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform application and UI framework (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl2

CONFLICTS=	linux-c6-qt47-x11-[0-9]*

DATADIR=	${PREFIX}/usr/share/${PORTNAME}4
DESCR=		${.CURDIR}/../../devel/${PORTNAME}4/pkg-descr
LINUXNAME=	${PORTNAME}${PKGNAMESUFFIX}
RPMVERSION=	15.el7_4
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	alsalib dri fontconfig jpeg openssl png qt tiff xorglibs
USE_LINUX_RPM=	yes

post-patch:
	@${RM} -r ${WRKSRC}/usr/share/icons

.include <bsd.port.mk>
