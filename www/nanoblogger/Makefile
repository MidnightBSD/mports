PORTNAME=	nanoblogger
PORTVERSION=	3.4.2
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	http://nanoblogger.sourceforge.net/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small weblog engine written in Bash for the command line
WWW=		https://nanoblogger.sourceforge.net/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	bash:shells/bash

USES=		cpe

NO_BUILD=	yes

SUB_FILES=	pkg-message

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e "s,%%PREFIX%%,${PREFIX},g" ${WRKSRC}/nb
	@${REINPLACE_CMD} -e "s,%%LOCALBASE%%,${LOCALBASE},g" ${WRKSRC}/nb
	@${REINPLACE_CMD} -e "s,%%DATADIR%%,${DATADIR},g" ${WRKSRC}/nb
	@${REINPLACE_CMD} -e "s,%%DOCSDIR%%,${DOCSDIR},g" ${WRKSRC}/nb
	@${RM} ${WRKSRC}/plugins/page/format/*.orig
	@${RM} ${WRKSRC}/plugins/entry/format/*.orig

do-install:
	@${INSTALL_SCRIPT} ${WRKSRC}/nb ${PREFIX}/bin
	@${INSTALL_DATA} ${WRKSRC}/nb.conf ${PREFIX}/etc/nb.conf.sample
	@${MKDIR} ${DATADIR}
.for data in default lang lib moods plugins
	@${MKDIR} ${DATADIR}/${data} && \
		( cd ${WRKSRC}/${data} && \
			${COPYTREE_SHARE} \* ${DATADIR}/${data} "! -name *.orig" )
.endfor
	${INSTALL_DATA} ${WRKSRC}/welcome-to-nb.txt ${STAGEDIR}${DATADIR}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for doc in ChangeLog README TODO
	${INSTALL_DATA} ${WRKSRC}/${doc} ${FAKE_DESTDIR}${DOCSDIR}
.endfor
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/html
	${INSTALL_DATA} ${WRKSRC}/docs/nanoblogger.html ${FAKE_DESTDIR}${DOCSDIR}/html

.include <bsd.port.mk>
