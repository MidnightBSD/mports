PORTNAME=	xorg-cf-files
PORTVERSION=	1.0.6
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org cf files for use with imake builds

LICENSE=	mit

USES=		xorg-cat:util

.include <bsd.port.pre.mk>

post-patch:
		@${REINPLACE_CMD} 's|\(define ExtraXaw[^ ]*\) [$$].*|\1 /**/|' \
			${WRKSRC}/X11.tmpl
.if defined(CC) && ${CC:T:M*clang*} == "clang"
		${REINPLACE_CMD} -e 's|/usr/bin/cpp|${LOCALBASE}/bin/ucpp|' \
			-e 's|-traditional|-s|' \
			-e 's|__FreeBSD_version|__MidnightBSD_version|g' \
			${WRKSRC}/FreeBSD.cf
.endif

.include <bsd.port.post.mk>
