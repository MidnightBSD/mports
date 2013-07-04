# New ports collection makefile for:	gnomemimedata
# Date created:				22 January 2002
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/misc/gnome-mime-data/Makefile,v 1.6 2011/12/15 00:57:50 laffer1 Exp $
# $FreeBSD: ports/misc/gnome-mime-data/Makefile,v 1.37 2007/04/03 20:38:53 marcus Exp $
#

PORTNAME=	gnome-mime-data
PORTVERSION=	2.18.0
PORTREVISION=	2
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME
DISTNAME=	gnome-mime-data-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A MIME and Application database for GNOME
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -lintl"

post-patch:
	@${REINPLACE_CMD} -e 's|[(]datadir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g' \
	    	${WRKSRC}/Makefile.in

.include <bsd.port.mk>
