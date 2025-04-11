PORTNAME=	bsdhwmon
PORTVERSION=	20151206
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hardware sensor monitoring utility for BSD
WWW=		https://github.com/koitsu/bsdhwmon

LICENSE=	bsd2

USE_GITHUB=	yes
GH_ACCOUNT=	koitsu
GH_TAGNAME=	9aec193

PLIST_FILES=	sbin/bsdhwmon share/man/man8/bsdhwmon.8.gz

OPTIONS_DEFINE=	DEBUG

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDEBUG}
MAKE_ARGS+=	DEBUG=1
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bsdhwmon ${STAGEDIR}${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/bsdhwmon.8 ${STAGEDIR}${PREFIX}/share/man/man8

.include <bsd.port.mk>
