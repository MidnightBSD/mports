# $MidnightBSD$

PORTNAME=	metamail
PORTVERSION=	2.7
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	http://ftp.funet.fi/pub/unix/mail/metamail/ \
		ftp://ftp.research.telcordia.com/pub/nsb/
DISTNAME=	mm${PORTVERSION}
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of MIME, the Multipurpose Internet Mail Extensions
LICENSE=	mit

OPTIONS_DEFINE=	X11
OPTIONS_DEFAULT=	X11
OPTIONS_SUB=	yes
X11_DESC=	X11 hebrew font support

WRKSRC=		${WRKDIR}/${DISTNAME}/src

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MX11}
BUILD_DEPENDS+=	bdftopcf:${PORTSDIR}/x11-fonts/bdftopcf \
		mkfontscale:${PORTSDIR}/x11-fonts/mkfontscale \
		mkfontdir:${PORTSDIR}/x11-fonts/mkfontdir
RUN_DEPENDS+=	xloadimage:${PORTSDIR}/x11/xloadimage \
		mkfontdir:${PORTSDIR}/x11-fonts/mkfontdir
USE_XORG=	x11
PLIST_SUB+=	X11=""
.else
PLIST_SUB+=	X11="@comment "
.endif

post-patch:
.if ! ${PORT_OPTIONS:MX11}
	@${REINPLACE_CMD} -e '/fonts/d' ${WRKSRC}/Makefile
.endif
	@${RM} ${WRKSRC}/bin/*.orig

.include <bsd.port.mk>
