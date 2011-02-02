# New ports collection makefile for:	GLE
# Date created:				29 August 2000
# Whom:					David Gilbert <dgilbert@velocet.ca>
#
# $MidnightBSD: mports/graphics/gle/Makefile,v 1.6 2009/11/21 15:56:11 laffer1 Exp $
# $FreeBSD: ports/graphics/gle/Makefile,v 1.14 2006/08/14 23:06:33 clsung Exp $
#

PORTNAME=	gle
PORTVERSION=	3.1.0
PORTREVISION=   2
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION} \
		http://linas.org/gle/pub/ \
		http://metalab.unc.edu/pub/Linux/libs/X/ \
		ftp://tsx-11.mit.edu/pub/linux/sources/libs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GL Tubing and Extrusion Library
LICENSE=	gpl2

USE_GL=		glut
USE_AUTOTOOLS=	libtool
USE_XORG=	x11 xext
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	"CFLAGS=-I${LOCALBASE}/include -L${LOCALBASE}/lib -lXext ${PTHREAD_LIBS}"


MAN3=		gle.3gle gleExtrusion.3gle gleHelicoid.3gle gleLathe.3gle \
		glePolyCone.3gle glePolyCylinder.3gle gleScrew.3gle \
		gleSetJoinStyle.3gle gleSetNumSides.3gle gleSpiral.3gle \
		gleSuperExtrusion.3gle gleTextureMode.3gle gleToroid.3gle \
		gleTwistExtrusion.3gle

post-patch:
.for file in ex_angle.c ex_cut_round.c ex_raw.c extrude.c round_cap.c segment.c texgen.c
	@${REINPLACE_CMD} -e "s/malloc.h/stdlib.h/g" ${WRKSRC}/src/${file}
.endfor

.include <bsd.port.mk>
