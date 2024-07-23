PORTNAME=	tnftp
PORTVERSION=	20230507
CATEGORIES=	ftp
MASTER_SITES=	https://cdn.netbsd.org/pub/NetBSD/misc/tnftp/ \
		https://ftp.uni-erlangen.de/netbsd/misc/tnftp/ \
		https://ftp.jaist.ac.jp/pub/NetBSD/misc/tnftp/ \
		https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enhanced ftp client from NetBSD
WWW=		https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/

LICENSE=	bsd2 bsd3
LICENSE_COMB=	multi

USES=		libedit ncurses ssl
GNU_CONFIGURE=	yes

PLIST_FILES=	bin/tnftp share/man/man1/tnftp.1.gz

.include <bsd.port.mk>
