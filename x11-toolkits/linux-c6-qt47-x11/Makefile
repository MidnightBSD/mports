# $MidnightBSD$

PORTNAME=	qt47-x11
PORTVERSION=	4.7.2
CATEGORIES=	x11-toolkits linux
MASTER_SITES=	FREEBSD_LOCAL/tijl/atrpms:amd64,i386
SRC_DISTFILES=	# unavailable
DIST_SUBDIR=	atrpms

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform application and UI framework (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl2

DATADIR=	${PREFIX}/usr/share/qt47
DESCR=		${.CURDIR}/../../devel/linux-c6-qt47/pkg-descr
RPMVERSION=	1_18.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	alsalib dri fontconfig jpeg openssl png qt tiff xorglibs
USE_LINUX_RPM=	yes

post-patch:
	@${RM} -r ${WRKSRC}/usr/share/icons

.include <bsd.port.mk>
