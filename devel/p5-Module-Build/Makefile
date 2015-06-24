# $MidnightBSD$

PORTNAME=	Module-Build
PORTVERSION=	0.4214
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build and install Perl modules

LICENSE=	artistic gpl
LICENSE_COMB=	dual

OPTIONS_DEFINE=	DOCS

USE_PERL5=	yes
PERL_MODBUILD=	yes

PORTDOCS=	Changes INSTALL README

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501400
BUILD_DEPENDS+=	p5-CPAN-Meta>=2.110420:${PORTSDIR}/devel/p5-CPAN-Meta \
		p5-CPAN-Meta-YAML>=0.003:${PORTSDIR}/devel/p5-CPAN-Meta-YAML \
		p5-Module-Metadata>=1.000002:${PORTSDIR}/devel/p5-Module-Metadata \
		p5-Parse-CPAN-Meta>=1.44.01:${PORTSDIR}/devel/p5-Parse-CPAN-Meta \
		p5-Perl-OSType>=1:${PORTSDIR}/devel/p5-Perl-OSType \
		p5-version>=0.87:${PORTSDIR}/devel/p5-version
RUN_DEPENDS+=	p5-CPAN-Meta>=2.110420:${PORTSDIR}/devel/p5-CPAN-Meta \
		p5-CPAN-Meta-YAML>=0.003:${PORTSDIR}/devel/p5-CPAN-Meta-YAML \
		p5-Module-Metadata>=1.000002:${PORTSDIR}/devel/p5-Module-Metadata \
		p5-Parse-CPAN-Meta>=1.44.01:${PORTSDIR}/devel/p5-Parse-CPAN-Meta \
		p5-Perl-OSType>=1:${PORTSDIR}/devel/p5-Perl-OSType \
		p5-version>=0.87:${PORTSDIR}/devel/p5-version
.endif

post-patch:
	@${RM} -f ${WRKSRC}/bin/config_data
	@${REINPLACE_CMD} -e '/script_files/d' ${WRKSRC}/Build.PL
	@${REINPLACE_CMD} -e '/^bin\/config_data/d' ${WRKSRC}/MANIFEST

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}/
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}/
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.post.mk>
