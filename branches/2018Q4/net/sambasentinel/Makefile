# New ports collection makefile for:	sambasentinel
# Date created:				May 30, 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	sambasentinel
PORTVERSION=	0.1
PORTREVISION=	0
CATEGORIES=	net
MASTER_SITES=	ftp://ftp.fasta.fh-dortmund.de/pub/linux/gentoo/distfiles/ \
		http://voodoo.bawue.com/download/
DISTNAME=	SambaSentinel-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SambaSentinel is a gtk-frontend to smbstatus with additional features
LICENSE=	gpl2

RUN_DEPENDS=	jags:${PORTSDIR}/net/jags

PLIST_FILES=	bin/SambaSentinel
WRKSRC=		${WRKDIR}/SambaSentinel
USE_GMAKE=	yes
USE_GNOME=	gtk12
ALL_TARGET=	SambaSentinel

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/SambaSentinel ${PREFIX}/bin

.include <bsd.port.mk>
