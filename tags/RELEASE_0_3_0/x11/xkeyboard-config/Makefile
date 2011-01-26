# New ports collection makefile for:	xkeyboard-config
# Date Created:				Dec 20 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/xkeyboard-config/Makefile,v 1.4 2007/07/27 09:51:19 pav Exp $
# $MidnightBSD$
#

PORTNAME=	xkeyboard-config
PORTVERSION=	1.0
CATEGORIES=	x11
MASTER_SITES=	http://xlibs.freedesktop.org/xkbdesc/
DISTNAME=	xkeyboard-config-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Keyboard Configuration Database
LICENSE=	x11

BUILD_DEPENDS=	xkbcomp:${PORTSDIR}/x11/xkbcomp \
		${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser


USE_BZIP2=	yes
USE_ICONV=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_PERL5_BUILD=yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--with-xkb-base=${PREFIX}/share/X11/xkb \
			--with-xkb-rules-symlink=xorg

MAKE_ENV+=	ICONV=${LOCALBASE}/bin/iconv

post-install:
	${MKDIR} /var/lib/xkb
	${LN} -s /var/lib/xkb ${PREFIX}/share/X11/xkb/compiled

.include <bsd.port.mk>
