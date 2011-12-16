# $MidnightBSD: mports/devel/xdg-utils/Makefile,v 1.1 2010/01/09 23:34:03 laffer1 Exp $

PORTNAME=	xdg-utils
PORTVERSION=	1.0.2
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://portland.freedesktop.org/download/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools to allow all applications to integrate with the free desktop
LICENSE=	mit

GNU_CONFIGURE=	yes
XDG_FILES=	xdg-desktop-icon \
		xdg-desktop-menu \
		xdg-email \
		xdg-icon-resource \
		xdg-mime \
		xdg-open \
		xdg-screensaver

PLIST_FILES+=	${XDG_FILES:S|^|bin/|}
MAN1+=		${XDG_FILES:S|$|.1|}

pre-patch:
	@${RM} -f ${WRKSRC}/*/*.orig

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/scripts/xdg-*

.include <bsd.port.mk>
