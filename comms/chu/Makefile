PORTNAME=	chu
PORTVERSION=	0.1.29
PORTREVISION=	1
CATEGORIES=	comms hamradio
MASTER_SITES=	SUNSITE/system/admin/time

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Synchronise computer clock to CHU radio station
WWW=		https://www.rossi.com/chu/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

NO_WRKSUBDIR=	yes

OPTIONS_DEFINE=	DOCS

post-extract:
	@${GZIP_CMD} -d ${WRKSRC}/testsignal.gz

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/chu|${PREFIX}/etc/chu|g' ${WRKSRC}/chu.c ${WRKSRC}/chu.8
	@${REINPLACE_CMD} -e 's|/sbin/chu|${PREFIX}/sbin/chu|g' ${WRKSRC}/chu.8
	@${REINPLACE_CMD} -e 's|gcc -O2|${CC} ${CFLAGS}|g' ${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/chu ${STAGEDIR}${PREFIX}/sbin
	@${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/testsignal ${STAGEDIR}${DATADIR}
	${INSTALL_MAN} ${WRKSRC}/chu.8 ${STAGEDIR}${PREFIX}/share/man/man8

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for d in TESTING chu.html chuman.html ntp.html
	${INSTALL_DATA} ${WRKSRC}/${d} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
