# $MidnightBSD$
# $FreeBSD: ports/textproc/p5-HTML-Tidy/Makefile,v 1.7 2007/10/04 18:57:40 tobez Exp $

PORTNAME=	HTML-Tidy
PORTVERSION=	1.56
PORTREVISION=	1
CATEGORIES=	textproc www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web validation in a Perl object using tidy

LICENSE=	artistic

BUILD_DEPENDS=	p5-libwww>=0:${PORTSDIR}/www/p5-libwww
LIB_DEPENDS=	libtidyp.so:${PORTSDIR}/textproc/tidyp
RUN_DEPENDS:=	${BUILD_DEPENDS}

OPTIONS_DEFINE=	DOCS

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

PORTDOCS=	Changes README.markdown

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' ${WRKSRC}/Makefile.PL

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR})
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."

.include <bsd.port.mk>
