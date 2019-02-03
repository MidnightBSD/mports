# $MidnightBSD$

PORTNAME=	oinkmaster
PORTVERSION=	2.0
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Help you update your snort rules after each update
LICENSE=	bsd3

RUN_DEPENDS=	wget:${PORTSDIR}/ftp/wget

NO_BUILD=	yes
USE_PERL5_RUN=	yes

PLIST_FILES=	bin/oinkmaster etc/oinkmaster.conf.sample \
		man/man1/oinkmaster.1.gz

.if !defined(NOPORTDOCS)
PORTDOCS=	README
.endif

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/bin/perl,${PERL},g' \
		-e 's,"tPf","tf",' \
		${WRKSRC}/oinkmaster.pl

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/oinkmaster.pl ${PREFIX}/bin/oinkmaster
	${INSTALL_DATA} ${WRKSRC}/oinkmaster.conf ${PREFIX}/etc/oinkmaster.conf.sample
	${INSTALL_MAN} ${WRKSRC}/oinkmaster.1 ${PREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
