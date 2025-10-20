PORTNAME=	arphicttf
PORTVERSION=	2.11
PORTREVISION=	0
CATEGORIES=	chinese x11-fonts
MASTER_SITES=	FREEBSD_LOCAL/rafan/chinese/
DISTNAME=	${PKGNAMEPREFIX}${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Four Chinese Big5/GB TrueType fonts made by Arphic Technology

LICENSE=	ARPHIC
LICENSE_NAME=	ARPHIC PUBLIC LICENSE
LICENSE_FILE=	${WRKSRC}/license/ENGLISH/ARPHICPL.TXT
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/arphic

TTF=		bkai00mp.ttf bsmi00lp.ttf gbsn00lp.ttf gkai00mp.ttf

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
.for ttf in ${TTF}
	${INSTALL_DATA} ${WRKSRC}/font/${ttf} ${STAGEDIR}${FONTSDIR}
.endfor
	@${MKDIR} ${STAGEDIR}${DATADIR}
	${CP} -fr ${WRKSRC}/license ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/logo.gif ${WRKSRC}/release.txt ${STAGEDIR}${DATADIR}

.include "${.CURDIR}/../ttfm/Makefile.ttf"
.include <bsd.port.mk>
