PORTNAME=	HTML-Tidy
PORTVERSION=	1.60
CATEGORIES=	textproc www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web validation in a Perl object using tidy
WWW=		https://metacpan.org/release/HTML-Tidy

LICENSE=	artistic2

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-libwww>=0:www/p5-libwww
LIB_DEPENDS=	libtidyp.so:textproc/tidyp

OPTIONS_DEFINE=	DOCS

USES=		perl5
USE_PERL5=	configure

PORTDOCS=	Changes README.markdown

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' ${WRKSRC}/Makefile.PL

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/HTML/Tidy/Tidy.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
