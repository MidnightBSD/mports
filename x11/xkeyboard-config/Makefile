# $FreeBSD: ports/x11/xkeyboard-config/Makefile,v 1.4 2007/07/27 09:51:19 pav Exp $
# $MidnightBSD: mports/x11/xkeyboard-config/Makefile,v 1.3 2012/03/03 01:52:56 laffer1 Exp $

PORTNAME=	xkeyboard-config
PORTVERSION=	2.5.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Keyboard Configuration Database
LICENSE=	mit

BUILD_DEPENDS=	xkbcomp:${PORTSDIR}/x11/xkbcomp \
		xsltproc:${PORTSDIR}/textproc/libxslt
XORG_CAT=	data

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	intlhack gnomehack
USE_PERL5_BUILD=yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-xkb-base=${PREFIX}/share/X11/xkb \
		--with-xkb-rules-symlink=xorg
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN7=		xkeyboard-config.7

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
CONFIGURE_ENV+=	MSGFMT="/bin/echo '(GNU '" \
		XGETTEXT="/bin/echo '(GNU '" \
		MSGMERGE="/bin/echo '(GNU '"
PLIST_SUB+=	NLS="@comment "
.else
USE_ICONV=	yes
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/bin/bash|/bin/sh|g' -e 's|==|=|g' \
		${WRKSRC}/rules/merge.sh

post-install:
	${MKDIR} /var/lib/xkb
	${LN} -sf /var/lib/xkb ${PREFIX}/share/X11/xkb/compiled

.include <bsd.port.mk>
