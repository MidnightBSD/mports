# New ports collection makefile for:    KBirthday
# Date created:                         2003/04/12
# Whom:                                 Heiner <h.eichmann@gmx.de>
#
# $MidnightBSD: mports/deskutils/kbirthday/Makefile,v 1.2 2008/06/19 22:48:09 laffer1 Exp $
# $FreeBSD: ports/deskutils/kbirthday/Makefile,v 1.15 2007/05/19 20:01:40 flz Exp $

PORTNAME=	kbirthday
PORTVERSION=	0.7.3
PORTREVISION=	1
CATEGORIES=	deskutils kde
MASTER_SITES=	http://www.gfai.de/~jaham/download/ \
		http://freshmeat.net/redir/kbirthday/32531/url_tgz/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE kicker-applet that reminds you of birthdays and anniversaries
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool:22
USE_GMAKE=	yes
USE_KDELIBS_VER=3
USE_LDCONFIG=	yes
# may or may not solve the alpha compilation issue....
CONFIGURE_ARGS=	--with-pic

# necesary to access the second master site by getting rid of the default switch -A
FETCH_CMD ?=/usr/bin/fetch -Rr

post-patch:
	${REINPLACE_CMD} -e "s,-Wmissing-prototypes,-fPIC," ${WRKSRC}/configure

.include <bsd.port.mk>
