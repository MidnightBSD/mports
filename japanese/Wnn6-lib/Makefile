PORTNAME=	Wnn6-lib
PORTVERSION=	2000.9.1
PORTREVISION=	2
CATEGORIES=	japanese
MASTER_SITES=	ftp://ftp.omronsoft.co.jp/pub/Wnn6/sdk_source/
DISTNAME=	Wnn6-SDK

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wnn6 client library
WWW=		https://www.omronsoft.co.jp/

LICENSE=	Wnn6
LICENSE_NAME=	Wnn6
LICENSE_FILE=	${WRKSRC}/contrib/im/Xsi/README
LICENSE_PERMS=	auto-accept

OPTIONS_DEFINE=	DOCS

USES=		imake
USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/src/contrib/im/Xsi
PORTDOCS=	README

.include <bsd.port.pre.mk>

CFLAGS+=       -Wno-error=int-conversion

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/X11R6,${LOCALBASE},g' \
		${WRKSRC}/config/Project.tmpl \
		${WRKSRC}/config/X11.tmpl \
		${WRKSRC}/Makefile.ini

do-build:
	(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV}  make World -f Makefile.ini)

post-install:
	${LN} -sf libwnn6_fromsrc.a ${STAGEDIR}${PREFIX}/lib/libwnn6.a
	${MKDIR} ${STAGEDIR}${PREFIX}/include/wnn6/wnn
	${INSTALL_DATA} ${WRKSRC}/Wnn/include/*.h ${STAGEDIR}${PREFIX}/include/wnn6/wnn
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR})

.include <bsd.port.post.mk>
