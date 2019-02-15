# $MidnightBSD$

PORTNAME=	pulseaudio
PORTVERSION=	0.9.21
CATEGORIES=	audio linux
PKGNAMESUFFIX=	-libs
LIB_DISTNAMES=	${LINUXNAME}-${DISTVERSIONFULL} \
		${LINUXNAME}-glib2-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for PulseAudio clients (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl2

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${LINUXNAME}-${PORTVERSION}
LINUXNAME=	${PORTNAME}${PKGNAMESUFFIX}
RPMVERSION=	26.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	dbuslibs libasyncns libsndfile tcp_wrappers-libs xorglibs
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
