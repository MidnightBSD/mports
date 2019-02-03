# $MidnightBSD$

PORTNAME=	xdg-utils
PORTVERSION=	1.1.1
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://portland.freedesktop.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools to allow all applications to integrate with the free desktop

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	minixmlto:textproc/minixmlto
RUN_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme \
		xprop:x11/xprop \
		xset:x11/xset

USES=		gmake
CONFIGURE_ENV=	XMLTO=${LOCALBASE}/bin/minixmlto
GNU_CONFIGURE=	yes
NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/scripts/xdg-*

.include <bsd.port.mk>
