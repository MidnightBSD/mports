# $MidnightBSD: mports/textproc/gtkspell/Makefile,v 1.8 2010/01/02 17:43:59 laffer1 Exp $

PORTNAME=	gtkspell
PORTVERSION=	2.0.16
PORTREVISION?=	1
CATEGORIES=	textproc gnome
MASTER_SITES=	http://gtkspell.sourceforge.net/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GTK+ 2 spell checking component
LICENSE=	gpl2

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	enchant.1:${PORTSDIR}/textproc/enchant

MAKE_JOBS_SAFE=	yes
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
