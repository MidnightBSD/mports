PORTNAME=	alsa-lib
PORTVERSION=	1.1.8
DISTVERSIONSUFFIX=	-1.el7
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Advanced Linux Sound Architecture libraries (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://www.alsa-project.org/

LICENSE=	gpl3

RUN_DEPENDS=	alsa-lib>0:audio/alsa-lib

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}

OPTIONS_DEFINE=	DOCS

post-patch:
	@${RM} -r ${WRKSRC}/etc/* ${WRKSRC}/lib/modprobe.d \
		${WRKSRC}/usr/share/doc/alsa-lib

post-install:
	${LN} -sf ${LOCALBASE}/etc/asound.conf ${STAGEDIR}${PREFIX}/etc

.include <bsd.port.mk>
