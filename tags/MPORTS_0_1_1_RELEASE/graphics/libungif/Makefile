# New ports collection makefile for:	libungif
# Date created:		03 May 1997
# Whom:			Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/libungif/Makefile,v 1.34 2006/08/14 23:06:35 clsung Exp $
#

PORTNAME=	libungif
PORTVERSION=	4.1.4
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE_EXTENDED}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools and library routines for working with GIF images

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_LDCONFIG=	yes

.if defined(WITHOUT_X11)
PLIST_SUB+=	X11='@comment '
CONFIGURE_ARGS+=	--with-x=no
PKGNAMESUFFIX=	-nox11
.else
USE_XLIB=	yes
PLIST_SUB+=	X11=''
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/UNCOMPRESSED_GIF ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.png ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
