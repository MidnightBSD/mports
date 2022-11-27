PORTNAME=	udns
PORTVERSION=	0.4
PORTREVISION=	1
CATEGORIES=	dns
MASTER_SITES=	http://www.corpit.ru/mjt/udns/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DNS resolver library with sync and async queries
WWW=		https://www.corpit.ru/mjt/udns.html

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LGPL

USES=		pkgconfig

HAS_CONFIGURE=	yes
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	IPV6 DOCS

ALL_TARGET=	staticlib shared

PORTDOCS=	*

SHLIB_MAJOR=	0

IPV6_CONFIGURE_ENABLE=	ipv6

PKGCONFIGDIR?=	${PREFIX}/libdata/pkgconfig

post-build:
	@cd ${WRKSRC} && ${STRIP_CMD} dnsget_s ex-rdns_s rblcheck_s

post-patch:
	@${SED} -e 's|%PREFIX%|${PREFIX}|g ; s|%VERSION%|${PORTVERSION}|g' \
	  ${FILESDIR}/libudns.pc.in > ${WRKDIR}/libudns.pc

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/libudns.so.${SHLIB_MAJOR} \
		${PREFIX}/lib/libudns.so.${SHLIB_MAJOR}
	${LN} -sf ${PREFIX}/lib/libudns.so.${SHLIB_MAJOR} \
		${PREFIX}/lib/libudns.so
	${INSTALL_DATA} ${WRKSRC}/udns.h ${PREFIX}/include/udns.h
	${INSTALL_DATA} ${WRKSRC}/libudns.a ${PREFIX}/lib/libudns.a
	${INSTALL_PROGRAM} ${WRKSRC}/dnsget_s ${PREFIX}/bin/dnsget
	${INSTALL_PROGRAM} ${WRKSRC}/rblcheck_s ${PREFIX}/bin/rblcheck
.for FILE in dnsget.1 rblcheck.1
	${INSTALL_MAN} ${WRKSRC}/${FILE} ${MANPREFIX}/man/man1/${FILE}
.endfor
.for FILE in udns.3
	${INSTALL_MAN} ${WRKSRC}/${FILE} ${MANPREFIX}/man/man3/${FILE}
.endfor

post-install:
	${INSTALL_DATA} ${WRKDIR}/libudns.pc ${STAGEDIR}${PKGCONFIGDIR}/

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for FILE in NEWS NOTES TODO
	${INSTALL_DATA} ${WRKSRC}/${FILE} ${FAKE_DESTDIR}${DOCSDIR}/${FILE}
.endfor

.include <bsd.port.mk>
