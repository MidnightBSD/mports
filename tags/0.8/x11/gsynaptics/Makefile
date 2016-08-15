# $MidnightBSD$

PORTNAME=	gsynaptics
PORTVERSION=	0.9.16
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	SFJP/${PORTNAME}/38463

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME Synaptics Touchpad setting tool

LICENSE=	gpl2

RUN_DEPENDS=	xf86-input-synaptics>0:${PORTSDIR}/x11-drivers/xf86-input-synaptics

USES=		gettext gmake pathfix pkgconfig
USE_GNOME=	gconf2 libglade2 gnomedocutils intltool
GNU_CONFIGURE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
