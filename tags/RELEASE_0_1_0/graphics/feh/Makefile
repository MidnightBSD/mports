# ports collection makefile for:	feh
# Date created:				16 Oct 2000
# Whom:					Jeremy Norris <ishmael27@home.com>
#
# $MidnightBSD: mports/graphics/feh/Makefile,v 1.1 2006/09/26 15:45:34 archite Exp $
# $FreeBSD: ports/graphics/feh/Makefile,v 1.22 2006/03/08 17:45:20 novel Exp $
#

PORTNAME=	feh
PORTVERSION=	1.3.4
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	http://linuxbrit.co.uk/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An image viewer that utilizes Imlib2

LIB_DEPENDS=	giblib.1:${PORTSDIR}/graphics/giblib
RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash

USE_XLIB=	yes
USE_PERL5=	yes
USE_GETOPT_LONG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"

MAN1=		feh.1

CPPFLAGS=	-I${LOCALBASE}/include -I${X11BASE}/include
LDFLAGS=	-L${LOCALBASE}/lib -L${X11BASE}/lib

post-patch:
	@${PERL} -pi.bak -e \
		's|^CFLAGS="-I|#CFLAGS="-I|g ; \
		 s|^LIBS="-L|#LIBS="-L|g' ${WRKSRC}/configure
	@${PERL} -pi.bak -e \
		's|-man install-docsDATA|-man|g' ${WRKSRC}/Makefile.in
	@${PERL} -pi.bak -e \
		's|^#!/bin|#!${LOCALBASE}/bin|g' ${WRKSRC}/cam/gen_cam_menu.sh
	@${PERL} -pi.bak -e \
		's|^LDFLAGS.*$$|LDFLAGS = \@LDFLAGS\@|g ; \
		 s|-I/usr/X11R6/include||g ; \
		 s|-I/usr/local/include/libpng||g ; \
		 s| getopt\.[cho]||g ; \
		 s| getopt1\.[co]||g ; \
		 s|^getopt|#getopt|g' ${WRKSRC}/src/Makefile.in
	@${PERL} -pi.bak -e \
		's|"getopt\.h"|<getopt.h>|g' ${WRKSRC}/src/feh.h
	@${PERL} -pi.bak -e \
		's|wprintf|weprintf|g' ${WRKSRC}/src/support.c

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in AUTHORS ChangeLog README TODO
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
