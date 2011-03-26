# $MidnightBSD$
# $FreeBSD: ports/net/pcnfsd/Makefile,v 1.18 2005/07/10 19:15:48 kris Exp $


PORTNAME=	pcnfsd
PORTVERSION=	93.02.16
CATEGORIES=	net
MASTER_SITES=	http://www.tux.org/pub/net/lprng/TOOLS/PCNFSD/ \
		http://lprng.sourceforge.net/DISTRIB/TOOLS/PCNFSD/ \
		http://public.planetmirror.com/pub/lprng/UNIXTOOLS/PCNFSD/
DISTNAME=	pcnfsd.93.02.16
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@MidnightBSD
COMMENT=	Sun PC NFS authentication and printing server
LICENSE=	other

MAN8=		pcnfsd.8
MANCOMPRESSED=	maybe
PLIST_FILES=	libexec/rpc.pcnfsd

NO_WRKSUBDIR=

post-extract:
	${CP} ${FILESDIR}/Makefile.inc ${WRKSRC}

.include <bsd.port.mk>
