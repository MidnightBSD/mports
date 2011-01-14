# New ports collection makefile for:	bugbuddy2
# Date created:				14 May 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/devel/bug-buddy/Makefile,v 1.3 2008/07/19 09:07:27 crash Exp $
# $FreeBSD: ports/devel/bug-buddy/Makefile,v 1.45 2007/10/24 23:35:03 marcus Exp $
#   $MCom: ports/devel/bug-buddy/Makefile,v 1.55 2007/10/06 22:03:31 mezz Exp $
#

PORTNAME=	bug-buddy
PORTVERSION=	2.30.0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@Midnight@FreeBSD.org
COMMENT=	A bug reporting tool for GNOME 2
LICENSE=        gpl2
LIB_DEPENDS=	gtop-2.0.7:${PORTSDIR}/devel/libgtop \
		soup-2.4.1:${PORTSDIR}/devel/libsoup

USE_BZIP2=	yes
USE_GETTEXT=	yes
INSTALLS_ICONS=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gnomedesktop gnomemenus libbonobo \
		gnomedocutils evolutiondataserver
GNOME_DESKTOP_VERSION=2
CONFIGURE_ARGS=	--program-prefix=''
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	bug-buddy.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|applications.menu|gnome-applications.menu|' \
		${WRKSRC}/src/bugzilla.c
	@${REINPLACE_CMD} -e 's|libelf.h||g ; \
	    	s|gelf.h||g' \
	    	${WRKSRC}/configure

.include <bsd.port.mk>
