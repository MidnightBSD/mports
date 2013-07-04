# New ports collection makefile for:	DockApp Library
# Date created:		17 July 1999
# Whom:			Jim Mock <jim@FreeBSD.org>
#
# $MidnightBSD: mports/x11-wm/libdockapp/Makefile,v 1.6 2011/02/02 21:39:27 laffer1 Exp $
# $FreeBSD: ports/x11-wm/libdockapp/Makefile,v 1.26 2006/05/13 05:00:42 edwin Exp $
#

PORTNAME=	libdockapp
PORTVERSION=	0.6.2
CATEGORIES=	x11-wm
MASTER_SITES=	http://solfertje.student.utwente.nl/~dalroi/libdockapp/files/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Standard library for Window Maker dock apps
LICENSE=	mit

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_XORG=	xext xpm
USE_GNOME=	
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--without-font --without-examples
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|$${CONFIG_SHELL-/bin/sh} $$ac_aux_dir|$$ac_aux_dir|' \
		${WRKSRC}/configure

post-install:
	@${MKDIR} ${PREFIX}/lib/X11/fonts/dockapp
.for file in fonts.alias fonts.dir *.pcf.gz
	${INSTALL_DATA} ${WRKSRC}/fonts/${file} ${PREFIX}/lib/X11/fonts/dockapp
.endfor
.if !defined(NOPORTEXAMPLES)
	@${MKDIR} ${EXAMPLESDIR}
.for file in README
	${INSTALL_DATA} ${WRKSRC}/examples/${file} ${EXAMPLESDIR}
.endfor
	@${MKDIR} ${EXAMPLESDIR}/basic
.for file in Imakefile README *.c *.xpm
	${INSTALL_DATA} ${WRKSRC}/examples/basic/${file} ${EXAMPLESDIR}/basic
.endfor
	@${MKDIR} ${EXAMPLESDIR}/rectangles
.for file in Imakefile *.c
	${INSTALL_DATA} ${WRKSRC}/examples/rectangles/${file} ${EXAMPLESDIR}/rectangles
.endfor
.endif

.include <bsd.port.mk>
