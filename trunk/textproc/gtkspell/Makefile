# $MidnightBSD: mports/textproc/gtkspell/Makefile,v 1.6 2009/09/20 02:12:49 laffer1 Exp $

PORTNAME=	gtkspell
PORTVERSION=	2.0.15
PORTREVISION?=	1
CATEGORIES=	textproc gnome
MASTER_SITES=	http://gtkspell.sourceforge.net/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GTK+ 2 spell checking component
LICENSE=	gpl2

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	enchant.1:${PORTSDIR}/textproc/enchant

USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack gtk20 intlhack
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS/ s|docs||' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>

.endif
