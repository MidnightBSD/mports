# Ports collection Makefile for:	epiphany-extensions
# Date created:				30 December 2003
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD: ports/www/epiphany-extensions/Makefile,v 1.52 2008/06/06 14:06:51 edwin Exp $
#   $MCom: ports/www/epiphany-extensions/Makefile,v 1.105 2008/03/11 17:19:08 mezz Exp $
# $MidnightBSD: mports/www/epiphany-extensions/Makefile,v 1.6 2011/12/15 00:57:55 laffer1 Exp $

PORTNAME=	epiphany-extensions
PORTVERSION=	2.22.2
PORTREVISION=	4
CATEGORIES=	www gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of add-ons for the Epiphany web browser
LICENSE=        gpl2     

BUILD_DEPENDS=	epiphany:${PORTSDIR}/www/epiphany
LIB_DEPENDS=	pcre.1:${PORTSDIR}/devel/pcre
RUN_DEPENDS=	epiphany:${PORTSDIR}/www/epiphany

USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_GECKO=	browser3<->firefox xulrunner
USE_GNOME=	gnomeprefix gnomehack intlhack 
INSTALLS_OMF=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LIBS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"
CONFIGURE_ARGS=	--with-mozilla=${GECKO}

GCONF_SCHEMAS=	smart-bookmarks.schemas

EPHY_EXTENSIONS=all,rss
EPHY_VERSION=	2.22

PLIST_SUB=	VERSION="2.22" EPHY_VERSION=${EPHY_VERSION}

OPTIONS=	OPENSP "Enable OpenSP SGML support" off

.include <bsd.mport.options.mk>

.if exists(${LOCALBASE}/share/pygtk/2.0/defs/epiphany.defs)
USE_PYTHON=	yes
PLIST_SUB+=	PYTHON=""
.else
PLIST_SUB+=	PYTHON="@comment "
.endif

.if defined(WITH_OPENSP)
CONFIGURE_ARGS+=	--enable-opensp=yes
.else
CONFIGURE_ARGS+=	--disable-opensp
.endif

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=--with-extensions="${EPHY_EXTENSIONS}"

.include <bsd.port.post.mk>
