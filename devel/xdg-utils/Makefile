# Created by: Michael Johnson <ahze@FreeBSD.org>
# $FreeBSD: head/devel/xdg-utils/Makefile 421690 2016-09-10 13:12:11Z amdmi3 $

PORTNAME=	xdg-utils
PORTVERSION=	1.1.1
CATEGORIES=	devel
MASTER_SITES=	http://portland.freedesktop.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools to allow all applications to integrate with the free desktop

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	xmlto:${PORTSDIR}/textproc/xmlto \
		lynx:www/lynx
RUN_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme \
		xprop:${PORTSDIR}/x11/xprop \
		xset:${PORTSDIR}/x11/xset

USES=		gmake
GNU_CONFIGURE=	yes
NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/scripts/xdg-*

.include <bsd.port.mk>
