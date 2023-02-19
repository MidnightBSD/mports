PORTNAME=	netcat
PORTVERSION=	1.10
PORTREVISION=	3
CATEGORIES=	net
MASTER_SITES=	SF/${DISTNAME}/unix%20netcat%20${PORTVERSION}%20by%20_Hobbit_/%5BUnnamed%20release%5D
DISTNAME=	nc${PORTVERSION:S/.//}

#PATCH_SITES=	ftp://sith.mimuw.edu.pl/pub/users/baggins/IPv6/
PATCH_SITES=	GENTOO
PATCHFILES=	nc-v6-20000918.patch.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple utility which reads and writes data across network connections
WWW=		http://nc110.sourceforge.net/

LICENSE=	unknown

USES=		tar:tgz

NO_WRKSUBDIR=	yes
ALL_TARGET=	freebsd

CFLAGS+=	-DFREEBSD
LDFLAGS+=	-static

PORTDOCS=	README
PLIST_FILES=	bin/netcat man/man1/netcat.1.gz

OPTIONS_DEFINE=	IPV6 TELNET GAPING DOCS
OPTIONS_DEFAULT=TELNET GAPING
TELNET_DESC=	Enable TELNET support
GAPING_DESC=	Enable GAPING_SECURITY_HOLE support

IPV6_CFLAGS=	-DINET6
TELNET_CFLAGS=	-DTELNET
GAPING_CFLAGS=	-DGAPING_SECURITY_HOLE

post-patch:
	@${SED} -e 's|%%DOCSDIR%%|${DOCSDIR}|g' ${FILESDIR}/nc.1 \
		> ${WRKDIR}/${PORTNAME}.1

do-build:
	cd ${WRKSRC} && ${CC} ${CFLAGS} ${PORTNAME}.c -o ${PORTNAME} ${LDFLAGS}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKDIR}/${PORTNAME}.1 ${MANPREFIX}/man/man1

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
