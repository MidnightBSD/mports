# New ports collection makefile for:   at-spi
# Date Created:			12 April 2002
# Whom:				Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/accessibility/at-spi/Makefile,v 1.3 2008/06/08 20:57:08 crash Exp $
# $FreeBSD: ports/accessibility/at-spi/Makefile,v 1.61 2007/10/24 23:34:39 marcus Exp $
#   $MCom: ports/accessibility/at-spi/Makefile,v 1.65 2007/10/15 17:22:02 mezz Exp $
#

PORTNAME=	at-spi
PORTVERSION=	1.22.1
PORTREVISION?=	0
CATEGORIES=	accessibility x11-toolkits
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An Assistive Technology Service Provider Interface
LICENSE=	lgpl

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnomehier intltool gail libbonobo \
		intlhack
USE_XORG=	x11 xtst
USE_PYTHON=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

post-extract:
	@${RM} -f ${WRKSRC}/registryd/Accessibility_Registry.server

post-patch:
	@${REINPLACE_CMD} -e "/^SUBDIRS =/s/test//" ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e "/^SUBDIRS =/s/docs//" ${WRKSRC}/Makefile.in

.include <bsd.port.mk>

.endif
