PORTNAME=	tcptrack
PORTVERSION=	1.4.2
PORTREVISION=	4
CATEGORIES=	net-mgmt
MASTER_SITES=	https://BSDforge.com/projects/source/net-mgmt/tcptrack/ \
		http://pkgs.fedoraproject.org/repo/pkgs/tcptrack/tcptrack-1.4.2.tar.gz/dacf71a6b5310caf1203a2171b598610/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Packet sniffer which displays TCP information like top(1)
WWW=		https://BSDforge.com/projects/net-mgmt/tcptrack/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		ncurses
USE_CXXSTD=	c++14

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share

PLIST_FILES=	bin/tcptrack share/man/man1/tcptrack.1.gz

.include <bsd.port.pre.mk>


CFLAGS+=	-Wno-error=unused-but-set-variable


.include <bsd.port.post.mk>
