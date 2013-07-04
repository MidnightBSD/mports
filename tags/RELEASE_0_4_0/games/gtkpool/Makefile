# New ports collection makefile for:	GTKPool
# Date created:				Nov 9 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/games/gtkpool/Makefile,v 1.2 2009/10/03 00:21:49 laffer1 Exp $
# $FreeBSD: ports/games/gtkpool/Makefile,v 1.5 2007/05/19 20:06:22 flz Exp $
#

PORTNAME=	gtkpool
PORTVERSION=	0.5.0
PORTREVISION=	1
CATEGORIES=	games
MASTER_SITES=	ftp://ftp.seul.org/pub/gtkpool/ \
		http://www.sourcefiles.org/Games/Sports/Pool/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A 2D pool game using the GTK+ toolkit
LICENSE=	gpl2

USE_GNOME=	gtk20
USE_PERL5_BUILD=yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	aclocal automake autoheader autoconf
ACLOCAL_ARGS=	-I ${LOCALBASE}/share/aclocal
AUTOMAKE_ARGS=	--add-missing
MAKE_JOBS_SAFE=	yes

post-patch:
.for file in application.cpp options.cpp
	@${REINPLACE_CMD} -e 's|/usr/local/share/gtkpool|${DATADIR}|' \
		${WRKSRC}/gtkpool/${file}
.endfor

.include <bsd.port.mk>
