# New ports collection makefile for:	gnomespell
# Date created:				29 December 2001
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/textproc/gnome-spell/Makefile,v 1.1 2007/09/03 23:31:17 laffer1 Exp $
# $FreeBSD: ports/textproc/gnome-spell/Makefile,v 1.29 2007/05/19 20:23:55 flz Exp $
#   $MCom: ports/textproc/gnome-spell/Makefile,v 1.9 2006/07/23 01:44:27 mezz Exp $
#

PORTNAME=	gnome-spell
PORTVERSION=	1.0.8
CATEGORIES=	textproc gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/gnome-spell/1.0
DISTNAME=	gnome-spell-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNOME/Bonobo component for spell checking

LIB_DEPENDS=	aspell.16:${PORTSDIR}/textproc/aspell

USE_BZIP2=	yes
USE_XLIB=	yes
USE_PERL5=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeui
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
PLIST_SUB=	VERSION=${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} -e 's|@mkdir_p@|mkdir -p|g' \
		${WRKSRC}/po/Makefile.in.in

.include <bsd.port.mk>
