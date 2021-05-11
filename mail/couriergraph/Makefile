# Created by: Xavier Beaudouin <kiwi@oav.net>

PORTNAME=	couriergraph
PORTVERSION=	20060202
PORTREVISION=	6
CATEGORIES=	mail
MASTER_SITES=	http://www.arschkrebs.de/postfix/${PORTNAME}/
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A RRDtool frontend for Courier statistics

LICENSE=	gpl

RUN_DEPENDS=	rrdtool>=0:databases/rrdtool \
		p5-File-Tail>=0:devel/p5-File-Tail

USES=		perl5 shebangfix
USE_PERL5=	run
SHEBANG_FILES=	couriergraph.cgi couriergraph.pl
USE_RC_SUBR=	${PORTNAME}
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

DATADIR?=	/var/db/couriergraph
COURIERGRAPH_USER?=	${WWWOWN}
COURIERGRAPH_GROUP?=	${WWWGRP}

PLIST_SUB=	COURIERGRAPH_USER=${COURIERGRAPH_USER} \
		COURIERGRAPH_GROUP=${COURIERGRAPH_GROUP}
SUB_LIST=	COURIERGRAPH_USER=${COURIERGRAPH_USER} \
		COURIERGRAPH_GROUP=${COURIERGRAPH_GROUP}
STARTUP_FILE=	${PREFIX}/etc/rc.d/couriergraph.sh

SUB_FILES=	pkg-message

pre-everything::
	@${ECHO_MSG}
	@${ECHO_MSG} "You may set the following options:"
	@${ECHO_MSG}
	@${ECHO_MSG} "DATADIR=/var/db/couriergraph	Where do you put RRD databases?"
	@${ECHO_MSG} "COURIERGRAPH_USER=www		User to run couriergraph (default: ${WWWOWN})"
	@${ECHO_MSG} "COURIERGRAPH_GROUP=www		Group to run couriergraph (default: ${WWWGRP})"
	@${ECHO_MSG}

# To avoid conflict between default WRKSRC and RC_SUBR file being the same
post-extract:
	@${MV} ${WRKDIR}/${PORTNAME} ${WRKSRC}

post-patch:
	@${REINPLACE_CMD} -e "s,%%DATADIR%%,${DATADIR}," \
		${WRKSRC}/couriergraph.cgi ${WRKSRC}/couriergraph.pl

do-install:
	@${MKDIR} ${PREFIX}/www/cgi-bin
	${INSTALL_SCRIPT} ${WRKSRC}/couriergraph.pl ${PREFIX}/sbin
	${INSTALL_SCRIPT} ${WRKSRC}/couriergraph.cgi ${PREFIX}/www/cgi-bin


.include <bsd.port.mk>
