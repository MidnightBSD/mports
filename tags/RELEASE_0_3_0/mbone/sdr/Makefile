# $MidnightBSD: mports/mbone/sdr/Makefile,v 1.3 2009/04/16 04:19:25 laffer1 Exp $

PORTNAME=	sdr
PORTVERSION=	3.0
PORTREVISION=	1
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

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 3000
MAKE_ARGS+=	"CC=gcc -g -O"
.endif

.include <bsd.port.post.mk>
