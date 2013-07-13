# $MidnightBSD: mports/archivers/squeeze/Makefile,v 1.1 2012/03/06 00:17:21 laffer1 Exp $
# $FreeBSD: ports/archivers/squeeze/Makefile,v 1.6 2011/11/09 15:25:23 miwi Exp $

PORTNAME=	squeeze
PORTVERSION=	0.2.3
PORTREVISION=	1
CATEGORIES=	archivers xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=	src/apps/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Squeeze is a modern and advanced archive manager
LICENSE=	gpl2

LICENSE=	GPLv2

LIB_DEPENDS=	thunar-vfs-1:${PORTSDIR}/x11-fm/thunar-vfs

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes

USES=		pkgconfig gettext pathfix desktop-file-utils
USE_XFCE=	configenv libutil thunar
USE_XORG=	x11
USE_GNOME=	gtk20 glib20 intltool intlhack
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
MAKE_JOB_SAFE=	yes

OPTIONS_DEFINE=		DOCS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
PLIST_SUB=	GTKDOC=""
.else
PLIST_SUB=	GTKDOC="@comment "
.endif

post-patch:
# Needed to remove gtk-doc installation
.if empty(PORT_OPTIONS:MDOCS)
	@${REINPLACE_CMD} -e "s|docs||g" ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
