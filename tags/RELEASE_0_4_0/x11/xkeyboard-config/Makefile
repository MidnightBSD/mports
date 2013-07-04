# $MidnightBSD: mports/x11/xkeyboard-config/Makefile,v 1.4 2012/09/02 00:14:05 laffer1 Exp $

PORTNAME=	xkeyboard-config
PORTVERSION=	2.9
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Keyboard Configuration Database
LICENSE=	mit

MASTER_SITE_SUBDIR=	individual/${XORG_CAT}/${PORTNAME}

BUILD_DEPENDS=	xkbcomp:${PORTSDIR}/x11/xkbcomp
XORG_CAT=	data

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	intlhack libxslt:build
USE_PATHFIX=	yes
USE_PERL5_BUILD=yes
GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=yes

CONFIGURE_ARGS=	--with-xkb-base=${PREFIX}/share/X11/xkb \
		--with-xkb-rules-symlink=xorg
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN7=		xkeyboard-config.7

.include <bsd.mport.options.mk>

# !nls case doesn't work correctly, comment it out.
#.if ${PORT_OPTIONS:MNLS}
USE_GETTEXT=	yes
USE_ICONV=	yes
PLIST_SUB+=	NLS=""
#.else
#CONFIGURE_ARGS+=--disable-nls
#PLIST_SUB+=	NLS="@comment "
#.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/bin/bash|/bin/sh|g' -e 's|==|=|g' \
		${WRKSRC}/rules/merge.sh

post-install:
	${MKDIR} /var/lib/xkb
	${LN} -sf /var/lib/xkb ${PREFIX}/share/X11/xkb/compiled

.include <bsd.port.mk>
