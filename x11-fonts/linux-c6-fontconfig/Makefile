# $MidnightBSD$

PORTNAME=	fontconfig
PORTVERSION=	2.8.0
PORTREVISION=	3
CATEGORIES=	x11-fonts linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML-based font configuration API for X Windows (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	mit

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	5.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	expat
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

post-patch:
	@${RM} -r ${WRKSRC}/etc ${WRKSRC}/usr/share/fonts ${WRKSRC}/var

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/etc
	${LN} -s ${LOCALBASE}/etc/fonts ${STAGEDIR}${PREFIX}/etc/
	${MKDIR} ${STAGEDIR}${PREFIX}/var/db/fontconfig

.include <bsd.port.mk>
