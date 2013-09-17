# $MidnightBSD$

PORTNAME=	gsynaptics
PORTVERSION=	0.9.16
CATEGORIES=	x11
MASTER_SITES=	SFJP/${PORTNAME}/38463

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME Synaptics Touchpad setting tool
LICENSE=	gpl2

RUN_DEPENDS=	xf86-input-synaptics>0:${PORTSDIR}/x11-drivers/xf86-input-synaptics

USE_PKGCONFIG=	build
USE_PATHFIX=	yes
USE_GETTEXT=	yes
USE_GNOME=	gconf2 libglade2 gnomedocutils
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		gsynaptics.1 gsynaptics-init.1

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
