PORTNAME=	oinkmaster
PORTVERSION=	2.0
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Help you update your snort rules after each update

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	wget:ftp/wget

NO_BUILD=	yes
NO_ARCH=	yes
USES=		perl5 shebangfix
USE_PERL5=	run
SHEBANG_FILES=	oinkmaster.pl

PLIST_FILES=	bin/oinkmaster \
		etc/oinkmaster.conf.sample \
		man/man1/oinkmaster.1.gz

PORTDOCS=	README

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's,"tPf","tf",' \
		${WRKSRC}/oinkmaster.pl

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/oinkmaster.pl ${PREFIX}/bin/oinkmaster
	${INSTALL_DATA} ${WRKSRC}/oinkmaster.conf ${PREFIX}/etc/oinkmaster.conf.sample
	${INSTALL_MAN} ${WRKSRC}/oinkmaster.1 ${PREFIX}/man/man1

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
