PORTNAME=	alsa-lib
PORTVERSION=	1.2.12
DISTVERSIONSUFFIX=	-1.el9
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Advanced Linux Sound Architecture libraries (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://www.alsa-project.org/

LICENSE=	gpl3

RUN_DEPENDS=	alsa-lib>0:audio/alsa-lib

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}

post-patch:
	-${RM} -r ${WRKSRC}/etc/* ${WRKSRC}/lib/modprobe.d \
		${WRKSRC}/usr/share/doc/alsa-lib

post-install:
	${LN} -sf ${LOCALBASE}/etc/asound.conf ${STAGEDIR}${PREFIX}/etc

.include <bsd.port.mk>
