# New ports collection makefile for:	mailgraph
# Date created:			11 September 2005
# Whom:				Xavier Beaudouin (kiwi@oav.net)
#
# $FreeBSD: ports/mail/couriergraph/Makefile,v 1.3 2006/08/08 15:11:44 clsung Exp $
# $MidnightBSD$
#

PORTNAME=	couriergraph
PORTVERSION=	20060202
CATEGORIES=	mail
MASTER_SITES=	ftp://ftp.oav.net/couriergraph/
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A RRDtool frontend for Courier statistics
LICENSE=	gpl

USE_PERL5=	yes

RUN_DEPENDS=	${SITE_PERL}/RRDp.pm:${PORTSDIR}/databases/rrdtool	\
		${SITE_PERL}/File/Tail.pm:${PORTSDIR}/devel/p5-File-Tail

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

DATADIR?=	/var/db/couriergraph
COURIERGRAPH_USER?=	${WWWOWN}
COURIERGRAPH_GROUP?=	${WWWGRP}

USE_RC_SUBR=	${PORTNAME}.sh
EXTRA_SUBS=	COURIERGRAPH_USER=${COURIERGRAPH_USER} COURIERGRAPH_GROUP=${COURIERGRAPH_GROUP}
SUB_LIST+=	${EXTRA_SUBS}
PLIST_SUB+=	${EXTRA_SUBS}
SUB_FILES+=	pkg-message

STARTUP_FILE=	${PREFIX}/etc/rc.d/couriergraph.sh


pre-everything::
	@${ECHO_MSG}
	@${ECHO_MSG} "You may set following options:"
	@${ECHO_MSG}
	@${ECHO_MSG} "DATADIR=/var/db/couriergraph		Where do you put RRD databases?"
	@${ECHO_MSG} "COURIERGRAPH_USER=www			User to run couriergraph (Default: ${WWWOWN})"
	@${ECHO_MSG} "COURIERGRAPH_GROUP=www			Group to run couriergraph (Default: ${WWWGRP})"
	@${ECHO_MSG}

post-patch:
	@${REINPLACE_CMD} -e "s,%%DATADIR%%,${DATADIR}," ${WRKSRC}/couriergraph.cgi
	@${REINPLACE_CMD} -e "s,%%DATADIR%%,${DATADIR}," ${WRKSRC}/couriergraph.pl

do-install:
	@${MKDIR} ${PREFIX}/www/cgi-bin
	${INSTALL_SCRIPT} ${WRKSRC}/couriergraph.pl ${PREFIX}/sbin
	${INSTALL_SCRIPT} ${WRKSRC}/couriergraph.cgi ${PREFIX}/www/cgi-bin


.include <bsd.port.mk>
