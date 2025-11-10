PORTNAME=	bindgraph
PORTVERSION=	0.3
PORTREVISION=	1
CATEGORIES=	dns
MASTER_SITES=	http://www.linux.it/~md/software/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RRDtool frontend for BIND statistics
WWW=		https://www.linux.it/~md/software/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	${SITE_PERL}/RRDp.pm:databases/rrdtool	\
		${SITE_PERL}/File/Tail.pm:devel/p5-File-Tail

NO_BUILD=	yes
USES=		perl5 tar:tgz

CGIDIR?=	${PREFIX}/www/cgi-bin
DATADIR?=	/var/db/bindgraph
BINDGRAPH_USER?=	${WWWOWN}
BINDGRAPH_GROUP?=	${WWWGRP}

USE_RC_SUBR=	${PORTNAME}
SUB_LIST+=	BINDGRAPH_USER=${BINDGRAPH_USER} BINDGRAPH_GROUP=${BINDGRAPH_GROUP}
PLIST_SUB=	CGIDIR=${CGIDIR:S,${PREFIX}/,,} \
		BINDGRAPH_USER="${BINDGRAPH_USER}" \
		BINDGRAPH_GROUP="${BINDGRAPH_GROUP}"

PORTDOCS=	README ChangeLog

OPTIONS_DEFINE=	DOCS

pre-everything::
	@${ECHO_MSG} "You may set following options:"
	@${ECHO_MSG} ""
	@${ECHO_MSG} "DATADIR=/var/db/bindgraph	Where do you put RRD databases?"
	@${ECHO_MSG} "CGIDIR=${PREFIX}/www/cgi-bin	Where do you put cgi?"
	@${ECHO_MSG} "BINDGRAPH_USER=www		User to run bindgraph (Default: ${WWWOWN})"
	@${ECHO_MSG} ""

post-patch:
	@${REINPLACE_CMD} -e "s,%%DATADIR%%,${DATADIR}," ${WRKSRC}/bindgraph.cgi

do-install:
	@${MKDIR} ${CGIDIR}
	@${MKDIR} ${DATADIR}
	@${CHOWN} -R ${BINDGRAPH_USER}:${BINDGRAPH_GROUP} ${DATADIR}/
	@${INSTALL_SCRIPT} ${WRKSRC}/bindgraph.pl ${PREFIX}/sbin/
	@${INSTALL_SCRIPT} ${WRKSRC}/bindgraph.cgi ${CGIDIR}/

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${FAKE_DESTDIR}${DOCSDIR}/
.endfor

.include <bsd.port.mk>
