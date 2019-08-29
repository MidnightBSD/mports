PORTNAME=	Mail-SPF
PORTVERSION=	2.9.0
PORTREVISION=	2
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-v${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reference implementation of the RFC 4408 SPF protocol

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-Error>=0:lang/p5-Error \
		p5-Net-DNS>=0.62:dns/p5-Net-DNS \
		p5-Net-DNS-Resolver-Programmable>=0.003:dns/p5-Net-DNS-Resolver-Programmable \
		p5-NetAddr-IP>=4:net-mgmt/p5-NetAddr-IP \
		p5-URI>=1.13:net/p5-URI
RUN_DEPENDS:=	${BUILD_DEPENDS}

CONFLICTS_INSTALL=	p5-Mail-SPF-Query-[0-9]*

OPTIONS_DEFINE=	DOCS

CONFIGURE_ARGS=	--install_path sbin=${PREFIX}/sbin
PERL_MODBUILD=	yes
USE_PERL5=	modbuild
USES=		perl5 shebangfix
NO_TEST=	yes

DOCSDIR=	${PREFIX}/share/doc/p5-Mail-SPF
PORTDOCS=	CHANGES README TODO

SHEBANG_FILES=	bin/spfquery sbin/spfd

.include <bsd.mport.options.mk>

post-patch:
	@${MV} ${WRKSRC}/sbin/spfd ${WRKSRC}/sbin/spfd.pl
	@${MV} ${WRKSRC}/bin/spfquery ${WRKSRC}/bin/spfquery.pl
	@${REINPLACE_CMD} -e 's|spfd|&.pl|; s|spfquery|&.pl|' ${WRKSRC}/Build.PL ${WRKSRC}/MANIFEST ${WRKSRC}/README

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${STAGEDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR}/
.endif

.include <bsd.port.mk>
