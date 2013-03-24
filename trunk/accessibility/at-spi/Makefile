# $MidnightBSD: mports/accessibility/at-spi/Makefile,v 1.9 2011/05/28 23:55:11 laffer1 Exp $

PORTNAME=	at-spi
PORTVERSION=	1.32.0
PORTREVISION?=	1
CATEGORIES=	accessibility x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Assistive Technology Service Provider Interface
LICENSE=	lgpl

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

RUN_DEPENDS=	at-spi2-atk>2.6.0:${PORTSDIR}/accessibility/at-spi2-atk

USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnomehier intlhack gtk20 gconf2 libbonobo
USE_XORG=	x11 xtst
USE_PYTHON=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	at-spi.schemas

post-extract:
	@${RM} -f ${WRKSRC}/registryd/Accessibility_Registry.server

post-patch:
	@${REINPLACE_CMD} -e "/^SUBDIRS =/s/test//" ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e "/^SUBDIRS =/s/docs//" ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e "/^SUBDIRS =/s/atk-bridge//" ${WRKSRC}/Makefile.in

.include <bsd.port.mk>

.endif
