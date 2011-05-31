# $MidnightBSD: mports/textproc/p5-HTML-Tidy/Makefile,v 1.2 2011/01/17 17:04:59 laffer1 Exp $
# $FreeBSD: ports/textproc/p5-HTML-Tidy/Makefile,v 1.7 2007/10/04 18:57:40 tobez Exp $

PORTNAME=	HTML-Tidy
PORTVERSION=	1.54
CATEGORIES=	textproc www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-


MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web validation in a Perl object using tidy
LICENSE=	gpl2

BUILD_DEPENDS=	${SITE_PERL}/LWP/Simple.pm:${PORTSDIR}/www/p5-libwww
LIB_DEPENDS=	tidyp:${PORTSDIR}/textproc/tidyp
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	5.8.0+

MAN3=		HTML::Tidy.3 HTML::Tidy::Message.3

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' \
		${WRKSRC}/Makefile.PL

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes README

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
