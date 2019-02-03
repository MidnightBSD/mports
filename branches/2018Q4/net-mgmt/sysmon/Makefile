# $MidnightBSD$

PORTNAME=	sysmon
PORTVERSION=	0.93
CATEGORIES=	net-mgmt
MASTER_SITES=	ftp://puck.nether.net/pub/jared/ \
		http://titan.oxeo.com/mirror/sysmon.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network tool designed for high performance and accurate monitoring

LICENSE=	gpl2

DOCS=		Changes.html binaries.html config.html docs.html index.html \
		jclient.jpg net-example.png sysmon.conf.man.html sysmon.jpg \
		sysmon.man.html reporting.xml-spec.txt
MANPAGE=	sysmon.man.8 sysmon.conf.man.8

GNU_CONFIGURE=	yes
USES=	alias
OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/sysmon ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/src/sysmond ${PREFIX}/bin
	${INSTALL_DATA} \
		${WRKSRC}/examples/sysmon.conf.dist \
			${PREFIX}/etc/sysmon.conf.sample
.for man in ${MANPAGE}
	${INSTALL_MAN} ${WRKSRC}/docs/${man:S/.8//} ${MANPREFIX}/man/man8/${man}
.endfor
	${MKDIR} ${DOCSDIR}
.for doc in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/docs/${doc} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
