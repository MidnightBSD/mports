# $MidnightBSD: mports/mbone/sdr/Makefile,v 1.2 2008/05/15 08:13:23 laffer1 Exp $

PORTNAME=	sdr
PORTVERSION=	3.0
CATEGORIES=	mbone tk
MASTER_SITES=	http://www-mice.cs.ucl.ac.uk/multimedia/software/sdr/3.0/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multicast Session Directory
LICENSE=	bsd4

BUILD_DEPENDS=	${LOCALBASE}/lib/libuclmmbase.a:${PORTSDIR}/devel/uclmmbase

PLIST_FILES=	bin/sdr
WRKSRC=		${WRKDIR}/sdr/freebsd
HAS_CONFIGURE=	yes
USE_GMAKE=	yes
USE_TK=		84
USE_TK_BUILD=	84

post-extract:
	@${CP} ${FILESDIR}/Makefile.freebsd ${WRKSRC}/Makefile.freebsd

.include <bsd.port.mk>
