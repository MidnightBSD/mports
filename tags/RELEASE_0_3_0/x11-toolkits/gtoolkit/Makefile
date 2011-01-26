# New ports collection makefile for:   gtoolkit
# Date created:        13 Jan 2002
# Whom:                Miguel Mendez <flynn@energyhq.homeip.net>
#
# $FreeBSD: ports/x11-toolkits/gtoolkit/Makefile,v 1.28 2006/11/30 07:08:41 dinoex Exp $
# $MidnightBSD: mports/x11-toolkits/gtoolkit/Makefile,v 1.6 2008/10/12 20:04:07 laffer1 Exp $
#

PORTNAME=	gtoolkit
PORTVERSION=	0.9.5
PORTREVISION=	5
CATEGORIES=	x11-toolkits gnustep
MASTER_SITES=	ftp://ftp.inf.uos.de/pub/elmar/gtk/objc-gtoolkit/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Obj-C wrapper for gtk, a x11 graphics library
LICENSE=	gpl2

USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_MAKEFILE=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

GNU_CONFIGURE=	yes
USE_GNOME=	gtk12
MAKE_ARGS+=	GNUSTEP_PREFIX=${PREFIX}/System
CONFIGURE_ARGS+=	--with-gnustep
WRKSRC=		${WRKDIR}/${DISTNAME}/GToolKit
CONFIGURE_WRKSRC=	${WRKDIR}/${DISTNAME}

post-patch:
	@${REINPLACE_CMD} -e 's#gtk-config#${GTK_CONFIG}#g' \
		${CONFIGURE_WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|)/Makefiles|)/Library/Makefiles|' \
		${WRKSRC}/Makefile.gnustep
	@${REINPLACE_CMD} -e 's|$$(GNUSTEP_MAKEFILES)|${FAKE_DESTDIR}${GNUSTEP_MAKEFILES}|' \
		${WRKSRC}/Makefile.postamble
	@${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_MAKEFILES}

.include <bsd.port.mk>
