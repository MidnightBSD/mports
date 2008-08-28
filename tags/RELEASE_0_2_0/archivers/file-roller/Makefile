# New ports collection makefile for:	fileroller
# Date created:				18 May 2002
# Whom:					Anders Nordby <anders@FreeBSD.org>
#
# $MidnightBSD: mports/archivers/file-roller/Makefile,v 1.4 2008/06/01 16:37:17 laffer1 Exp $
# $FreeBSD: ports/archivers/file-roller/Makefile,v 1.65 2007/07/03 06:38:06 marcus Exp $
#   $MCom: ports/archivers/file-roller/Makefile,v 1.117 2007/03/12 23:23:57 marcus Exp $
#

PORTNAME=	file-roller
PORTVERSION=	2.22.4
PORTEPOCH=	1
CATEGORIES=	archivers gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An archive manager for zip files, tar, etc
LICENSE=	gpl2

# We need GNU tar for this port
RUN_DEPENDS=	${LOCALBASE}/bin/gtar:${PORTSDIR}/archivers/gtar

USE_LDCONFIG=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_XORG=	x11
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack desktopfileutils nautilus2 \
		gnomedocutils
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	file-roller.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/src/fr-command-tar.c
	@${FIND} ${WRKSRC} -name "fr-command-*.c" | ${XARGS} ${REINPLACE_CMD} \
		-e 's|atoll|fr_atoll|g'

post-install:
	@-update-desktop-database
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in AUTHORS NEWS README TODO
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
