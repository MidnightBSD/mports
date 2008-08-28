# New ports collection makefile for:	gtkspell2
# Date created:				19 Aug 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/textproc/gtkspell/Makefile,v 1.3 2007/05/18 04:50:17 ctriv Exp $
# $FreeBSD: ports/textproc/gtkspell/Makefile,v 1.28 2006/05/31 22:18:46 mezz Exp $
#

PORTNAME=	gtkspell
PORTVERSION=	2.0.11
PORTREVISION?=	5
CATEGORIES=	textproc gnome
MASTER_SITES=	http://gtkspell.sourceforge.net/download/
DISTNAME=	${PORTNAME:S/2$//}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GTK+ 2 spell checking component

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	pspell.16:${PORTSDIR}/textproc/aspell

USE_AUTOTOOLS=	libtool:15
USE_PERL5=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack gtk20
GNU_CONFIGURE=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS/ s|docs||' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>

.endif
