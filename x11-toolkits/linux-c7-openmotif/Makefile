PORTNAME=	motif
PORTVERSION=	2.3.4
DISTVERSIONSUFFIX=	-14.el7_5
PORTREVISION=	6
CATEGORIES=	x11-toolkits linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Motif toolkit libraries (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://motif.ics.com/

LICENSE=	lgpl2.1

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	xorglibs
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}
DESCR=		${.CURDIR}/../open-${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

post-patch:
	@${RM} -r ${WRKSRC}/etc ${WRKSRC}/usr/bin ${WRKSRC}/usr/include \
		${WRKSRC}/usr/share/X11 ${WRKSRC}/usr/share/man

.include <bsd.port.mk>
