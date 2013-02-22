# $MidnightBSD: mports/x11-toolkits/libXaw/Makefile,v 1.5 2012/03/11 18:41:51 laffer1 Exp $

PORTNAME=	libXaw
PORTVERSION=	1.0.9
CATEGORIES=	x11-toolkits

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Athena Widgets library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	printproto:both x11 xau xext xextproto xmu xp xpm xproto:both xt
USE_GMAKE=	yes
CONFIGURE_ARGS=	--without-xmlto

PORTDOCS=	*

.if defined(NOPORTDOCS)
CONFIGURE_ARGS+=--disable-specs
post-configure:
	@${REINPLACE_CMD} -e '/AM_MAKEFLAGS/s/ install-exec-am install-data-am/ install-exec-am/' ${WRKSRC}/specs/Makefile
.endif

MAN3=		Xaw.3

.include <bsd.port.mk>
