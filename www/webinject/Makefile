PORTNAME=	webinject
PORTVERSION=	1.41
CATEGORIES=	www perl5 devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}%20-%20Source%20Code%20%28with%20UNIX%20style%20line%20endings%29
DISTNAME=	${PORTNAME}-${PORTVERSION}.src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for automated testing of web applications
WWW=		http://www.webinject.org/

RUN_DEPENDS=	p5-libwww>=0:www/p5-libwww \
		p5-Error>=0:lang/p5-Error \
	        p5-XML-Simple>=0:textproc/p5-XML-Simple \
		p5-Crypt-SSLeay>=0:security/p5-Crypt-SSLeay

USES=		perl5 shebangfix
SHEBANG_FILES=	webinject.pl
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	bin/webinject.pl \
		${DATADIR:S,^${PREFIX}/,,}/config.xml \
		${DATADIR:S,^${PREFIX}/,,}/testcases.xml

PORTDOCS=	LICENSE README

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${DATADIR}
	@cd ${WRKSRC} && ${INSTALL_DATA} *.xml ${DATADIR}
	@cd ${WRKSRC} && ${INSTALL_SCRIPT} webinject.pl ${PREFIX}/bin
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}

.include <bsd.port.mk>
