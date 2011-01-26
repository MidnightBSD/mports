# $MidnightBSD: mports/textproc/gnome-spell/Makefile,v 1.2 2008/03/04 02:01:31 laffer1 Exp $

PORTNAME=	gnome-spell
PORTVERSION=	1.0.8
PORTREVISION=	1
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNOME/Bonobo component for spell checking
LICENSE=	gpl2

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
