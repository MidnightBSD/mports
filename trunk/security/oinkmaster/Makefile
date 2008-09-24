# Ports collection makefile for:	oinkmaster
# Date created:			September 24, 2008
# Whom:				laffer1
#
# $MidnightBSD$
# $FreeBSD: ports/security/oinkmaster/Makefile,v 1.14 2008/06/06 14:00:58 edwin Exp $
#

PORTNAME=	oinkmaster
PORTVERSION=	2.0
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Help you update your snort rules after each update
LICENSE=	bsd3

RUN_DEPENDS=	wget:${PORTSDIR}/ftp/wget

NO_BUILD=	yes
USE_PERL5_RUN=	yes

PLIST_FILES=	bin/oinkmaster etc/oinkmaster.conf.sample

.if !defined(NOPORTDOCS)
PORTDOCS=	README
.endif

MAN1=		oinkmaster.1
MANCOMPRESSED=	no

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/bin/perl,${PERL},g' \
		-e 's,"tPf","tf",' \
		${WRKSRC}/oinkmaster.pl

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/oinkmaster.pl ${PREFIX}/bin/oinkmaster
	${INSTALL_DATA} ${WRKSRC}/oinkmaster.conf ${PREFIX}/etc/oinkmaster.conf.sample
	${INSTALL_MAN} ${WRKSRC}/${MAN1} ${PREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
