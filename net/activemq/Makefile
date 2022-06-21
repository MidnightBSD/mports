PORTNAME=	activemq
PORTVERSION=	5.17.1
CATEGORIES=	net java
MASTER_SITES=	APACHE/${PORTNAME}/${PORTVERSION}
DISTNAME=	apache-${PORTNAME}-${PORTVERSION}
EXTRACT_SUFX=	-bin.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Messaging and Integration Patterns provider

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe
CPE_VENDOR=	apache
USE_JAVA=	1.8+
USE_RC_SUBR=	activemq

NO_ARCH=	yes
NO_BUILD=	yes

USERS=		activemq
GROUPS=		activemq

PORTDATA=	*
PORTDOCS=	*
PORTEXAMPLES=	*

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	@${MKDIR} ${STAGEDIR}${ETCDIR}
	cd ${WRKSRC}/conf && for f in *; do \
		${INSTALL_DATA} ${WRKSRC}/conf/$$f ${STAGEDIR}${ETCDIR}/$$f.sample; \
	done
	@${MKDIR} ${STAGEDIR}${DATADIR}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bin/activemq* ${STAGEDIR}${DATADIR}/bin
	${RLN} ${STAGEDIR}${DATADIR}/bin/activemq ${STAGEDIR}${PREFIX}/bin
	${RLN} ${STAGEDIR}${DATADIR}/bin/activemq-diag ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/bin/activemq.jar ${WRKSRC}/bin/wrapper.jar \
		${STAGEDIR}${DATADIR}/bin
	@${MKDIR} ${FAKE_DESTDIR}/var/db/activemq
	${RLN} ${FAKE_DESTDIR}/var/db/activemq ${STAGEDIR}${DATADIR}/data
	${RLN} ${STAGEDIR}${ETCDIR} ${STAGEDIR}${DATADIR}/conf
	cd ${WRKSRC} && ${COPYTREE_SHARE} "lib webapps webapps-demo" \
		${STAGEDIR}${DATADIR}

do-install-DOCS-on:
	cd ${WRKSRC}/docs && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/NOTICE ${WRKSRC}/README.txt ${FAKE_DESTDIR}${DOCSDIR}
	${RLN} ${FAKE_DESTDIR}${DOCSDIR} ${FAKE_DESTDIR}${DATADIR}/docs

do-install-EXAMPLES-on:
	cd ${WRKSRC}/examples && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR}
	${RLN} ${FAKE_DESTDIR}${EXAMPLESDIR} ${FAKE_DESTDIR}${DATADIR}/examples

.include <bsd.port.mk>
