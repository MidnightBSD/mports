PORTNAME=	bglibs
PORTVERSION=	2.04
CATEGORIES=	devel
MASTER_SITES=	http://untroubled.org/${PORTNAME}/archive/ \
		http://untroubled.org/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	One stop library package by Bruce Guenter
WWW=		https://untroubled.org/bglibs/

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool:build perl5
USE_PERL5=	run configure
BGLIBS_INC=	${PREFIX}/include/${PORTNAME}
BGLIBS_LIB=	${PREFIX}/lib/${PORTNAME}
USE_LDCONFIG=	${BGLIBS_LIB}

DOCS=		NEWS README TODO doc/html/*

OPTIONS_DEFINE=	DOCS

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} '/main/s/^void/int/' ${WRKSRC}/sys/try*.c

do-configure:
	${ECHO_CMD} "${CC} ${CFLAGS}"	> ${WRKSRC}/conf-cc
	${ECHO_CMD} "${CC} ${STRIP} ${LDFLAGS}"	> ${WRKSRC}/conf-ld
	${ECHO_CMD} "${FAKE_DESTDIR}${PREFIX}"		> ${WRKSRC}/conf-home
	${ECHO_CMD} "${FAKE_DESTDIR}${PREFIX}/bin"	> ${WRKSRC}/conf-bin
	${ECHO_CMD} "${FAKE_DESTDIR}${PREFIX}/man"	> ${WRKSRC}/conf-man
	${ECHO_CMD} "${FAKE_DESTDIR}${BGLIBS_INC}"	> ${WRKSRC}/conf-include
	${ECHO_CMD} "${FAKE_DESTDIR}${BGLIBS_LIB}"	> ${WRKSRC}/conf-lib

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/bglibs/*.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
