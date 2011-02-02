# New ports collection makefile for:	devhelp
# Date created:				29 May 2003
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD: mports/devel/devhelp/Makefile,v 1.8 2011/01/15 04:20:17 laffer1 Exp $
# $FreeBSD: ports/devel/devhelp/Makefile,v 1.26 2007/09/12 19:25:47 marcus Exp $
#

PORTNAME=	devhelp
PORTVERSION=	0.19
PORTREVISION=	2
CATEGORIES?=	devel gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C,^([[:digit:]]+\.[[:digit:]]+).*,\1,}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Developer help browser for GNOME 2
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/lib/${MOZILLA}/components/libwidget_gtk2.so:${PORTSDIR}/www/${MOZILLA}
RUN_DEPENDS=	${LOCALBASE}/lib/${MOZILLA}/components/libwidget_gtk2.so:${PORTSDIR}/www/${MOZILLA}

MOZILLA=	browser3

.if !defined(WITH_MOZILLA)
MOZILLA=	browser3
.else
.if ${WITH_MOZILLA} == "xulrunner"
MOZILLA=	xulrunner
.elif ${WITH_MOZILLA} == "seamonkey"
MOZILLA=	seamonkey
.endif
.endif

USE_BZIP2=	yes
USE_XLIB=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack intlhack gnomeprefix libgnomeui libwnck
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_LDCONFIG=	${LOCALBASE}/lib/${MOZILLA}
GCONF_SCHEMAS=	devhelp.schemas
CONFIGURE_ENV=	CPPFLAGS="${PTHREAD_CFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="${PTHREAD_LIBS} -L${LOCALBASE}/lib"
.if ${MOZILLA} == "browser3"
CONFIGURE_ARGS=	--with-gecko=firefox
.else
CONFIGURE_ARGS=	--with-gecko=${MOZILLA}
.endif
OPTIONS=		GEDIT "Enable GEdit plug-in support" off

.include <bsd.port.pre.mk>

.if defined(WITH_GEDIT)
BUILD_DEPENDS+=	gedit:${PORTSDIR}/editors/gedit
RUN_DEPENDS+=	gedit:${PORTSDIR}/editors/gedit
PLIST_SUB+=	GEDIT=""
.else
PLIST_SUB+=	GEDIT="@comment "
.endif

# This target is only meant to be used by the port maintainer.
x-generate-plist:
	(${PORTSDIR}/Tools/scripts/plist -d -m ${MTREE_FILE} ${PREFIX}|${SED} -E 's,.*share/nls/.+$$,,g;s,^@dirrm share/((gnome/[^d]|pixmaps|application|locale).*|gnome$$),,;s,^@dirrm etc/gconf.*,,;s,^etc/gconf/gconf.*,,'|${TR} -s '\n') > temp-pkg-plist

post-patch:
.if defined(WITHOUT_GEDIT)
	@${REINPLACE_CMD} -e 's|gedit-plugin||' \
		${WRKSRC}/misc/Makefile.in
.endif

.include <bsd.port.post.mk>
