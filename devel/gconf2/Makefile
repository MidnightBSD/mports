# New ports collection makefile for:	gconf2
# Date created:				28th June 2000
# Whom:					Ade Lovett <ade@FreeBSD.org>
#
# $FreeBSD: ports/devel/gconf2/Makefile,v 1.73 2006/09/04 23:12:28 mezz Exp $
#   $MCom: ports/devel/gconf2/Makefile,v 1.72 2006/04/13 07:52:32 bland Exp $
# $MidnightBSD: mports/devel/gconf2/Makefile,v 1.6 2009/10/19 19:11:55 crash Exp $
#

PORTNAME=	gconf2
PORTVERSION=	2.26.2
PORTREVISION?=	1
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/GConf/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	GConf-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A configuration database system for GNOME
LICENSE=	lgpl

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)
LIB_DEPENDS=    dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
                polkit.2:${PORTSDIR}/sysutils/policykit
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_GNOME=	gnomehier gnomehack orbit2 gtk20 libxml2 ltverhack referencehack intlhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc
#		--enable-gconf-source=${PREFIX}/etc/gconf/schemas \

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
MAN1=		gconftool-2.1
OPTIONS=        LDAP "Enable LDAP support" off

.include <bsd.port.pre.mk>

.if defined(WITH_LDAP)
USE_OPENLDAP=	yes
CONFIGURE_ARGS+=--with-openldap
PLIST_SUB+=	LDAP=""
.else
CONFIGURE_ARGS+=--without-openldap
PLIST_SUB+=	LDAP="@comment "
.endif

.include <bsd.port.post.mk>

.endif
