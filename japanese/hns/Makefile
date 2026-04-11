PORTNAME=	hns
PORTVERSION=	2.19.9
PORTREVISION=	1
CATEGORIES=	japanese www perl5
MASTER_SITES=	OSDN/h14m

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hyper NIKKI System, a CGI system for Electric Diary Interchange
WWW=		http://www.h14m.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/GPL.txt

USES=		perl5 shebangfix
SHEBANG_FILES=	contrib/isystem-0.9.10/index.cgi.in \
		public_html/diary/index.cgi.in
perl_OLD_CMD=	%PERL_PATH%
NO_BUILD=	yes
NO_ARCH=	yes

PLIST_FILES=	bin/hns-setup bin/todayhns
PORTDATA=	*

do-install:
	@${MKDIR} ${DATADIR}
	${CP} -pR ${WRKSRC}/ ${DATADIR}
	${INSTALL_SCRIPT} ${WRKDIR}/hns-setup ${PREFIX}/bin/hns-setup
	${INSTALL_SCRIPT} ${WRKSRC}/contrib/todayhns/todayhns \
		${PREFIX}/bin/todayhns

.include <bsd.port.mk>
