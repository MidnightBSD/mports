# New ports collection makefile for:	GtkGLExt
# Date created:				6 November 2002
# Whom:					Kimura Fuyuki <fuyuki@hadaly.org>
#
# $MidnightBSD: mports/x11-toolkits/gtkglext/Makefile,v 1.1 2007/03/15 01:55:32 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/gtkglext/Makefile,v 1.24 2006/08/15 01:13:37 clsung Exp $
#

PORTNAME=	gtkglext
PORTVERSION=	1.2.0
CATEGORIES=	x11-toolkits
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An OpenGL extension to GTK
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix gnometarget gtk20
USE_GL=		yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes

.include <bsd.port.mk>
