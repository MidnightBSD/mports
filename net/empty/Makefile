# Created by: Mikhail Zakharov <zmey20000@yahoo.com>

PORTNAME=	empty
PORTVERSION=	0.6.20b
CATEGORIES=	net
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Expect-like tool for pure shell

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

DOCS=		CHANGELOG COPYRIGHT README README.CYGWIN
EXAMPLES=	README em_ssh.sh em_ssh_2.sh em_sh.sh \
		em_telnet.sh em_telnet_2.sh emsu.sh runtests.sh
MAKE_ARGS+=	CC="${CC}"
USES=		tar:tgz

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/empty ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/empty.1 ${STAGEDIR}${MAN1PREFIX}/man/man1
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${EXAMPLES:S,^,${WRKSRC}/examples/,} ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
