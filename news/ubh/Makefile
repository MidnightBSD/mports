PORTNAME=	ubh
PORTVERSION=	2.5
PORTREVISION=	3
CATEGORIES=	news graphics
MASTER_SITES=	http://ubh.sourceforge.net/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl script to download and decode binaries posted to Usenet
WWW=		https://ubh.sourceforge.net/

RUN_DEPENDS=	\
	p5-News-Newsrc>=0:news/p5-News-Newsrc \
	p5-Mail-Tools>=0:mail/p5-Mail-Tools \
	p5-IO-Stringy>=0:devel/p5-IO-Stringy \
	p5-MIME-Tools>=0:mail/p5-MIME-Tools \
	p5-String-CRC32>=0:devel/p5-String-CRC32

NO_BUILD=	YES
USES=		perl5 shebangfix
SHEBANG_FILES=	ubh

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/ubh ${STAGEDIR}${PREFIX}/bin
	${CP} -R ${WRKSRC}/examples ${STAGEDIR}${PREFIX}/share/ubh
	${MKDIR} ${STAGEDIR}${PREFIX}/share/doc/ubh
	${INSTALL_DATA} ${WRKSRC}/doc/ubh.html ${STAGEDIR}${PREFIX}/share/doc/ubh

.include <bsd.port.mk>
