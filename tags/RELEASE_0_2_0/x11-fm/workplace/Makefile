# New ports collection makefile for:	workplace
# Date created:				7 March 1998
# Whom:					Andrey Zakhvatov
#
# $MidnightBSD: mports/x11-fm/workplace/Makefile,v 1.3 2008/05/21 06:17:03 laffer1 Exp $
# $FreeBSD: ports/x11-fm/workplace/Makefile,v 1.28 2006/03/07 08:27:56 ade Exp $
#

PORTNAME=	workplace
PORTVERSION=	1.0.a3
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	x11-fm
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	trevor

PATCH_SITES=	http://people.freebsd.org/~trevor/ports/
PATCHFILES=	workplace-1.0.a3+tj1.diff.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File manager and launcher
LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_GNOME=	gtk12
USE_XLIB=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include/glib12 \
		-I${LOCALBASE}/include/gtk12" \
		LIBS="-L${LOCALBASE}/lib"

pre-configure:
	@ ${RM} ${WRKSRC}/config.cache

do-install:
	@ ${INSTALL_PROGRAM} ${WRKSRC}/src/workplace ${PREFIX}/bin
	@ ${MKDIR} ${PREFIX}/include/X11/pixmaps
	@ ${INSTALL_DATA} ${WRKSRC}/icons/*.xpm ${PREFIX}/include/X11/pixmaps
	@ ${MKDIR} ${PREFIX}/share/doc/workplace
.if !defined(NOPORTDOCS)
.for file in AUTHORS INSTALL README TODO
	@ ${INSTALL_DATA} ${WRKSRC}/${file} ${PREFIX}/share/doc/workplace
.endfor
.endif
	@ ${MKDIR} ${PREFIX}/share/examples/workplace
	@ ${INSTALL_DATA} ${WRKSRC}/example/* ${PREFIX}/share/examples/workplace

.include <bsd.port.mk>
