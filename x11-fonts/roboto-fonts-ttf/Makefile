# Created by: Winston Weinert <winstonw@lavabit.com>

PORTNAME=	roboto-fonts-ttf
PORTVERSION=	2.134
DISTVERSIONPREFIX=v
PORTEPOCH=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Roboto typeface family

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
NO_BUILD=	yes
USES=		fonts

USE_GITHUB=	yes
GH_ACCOUNT=	google
GH_PROJECT=	roboto

SUB_FILES=	pkg-message

PLIST_SUB=	FCDIR=${FCDIR} FCDIR_LINKS=${FCDIR_LINKS}
FCDIR?=		etc/fonts/conf.avail
FCDIR_LINKS=	${FCDIR:S|conf.avail|conf.d|}

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/hinted/*.ttf ${STAGEDIR}${FONTSDIR}
	${MKDIR} ${STAGEDIR}${PREFIX}/${FCDIR}/ ${STAGEDIR}${PREFIX}/${FCDIR_LINKS}/
	${INSTALL_DATA} ${FILESDIR}/*.conf ${STAGEDIR}${PREFIX}/${FCDIR}/
	cd ${STAGEDIR}${PREFIX}/${FCDIR_LINKS}/ && ${LN} -fs ../conf.avail/*.conf .

.include <bsd.port.mk>
