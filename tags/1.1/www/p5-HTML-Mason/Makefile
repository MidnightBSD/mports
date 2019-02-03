# $MidnightBSD$

PORTNAME=	HTML-Mason
PORTVERSION=	1.45
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	High-performance, dynamic web site authoring system
LICENSE=	perl

BUILD_DEPENDS=	p5-Class-Container>=0.7:${PORTSDIR}/devel/p5-Class-Container \
		p5-HTML-Parser>0:${PORTSDIR}/www/p5-HTML-Parser
RUN_DEPENDS=	p5-Cache-Cache>=1:${PORTSDIR}/devel/p5-Cache-Cache \
		p5-Class-Container>=0.7:${PORTSDIR}/devel/p5-Class-Container \
		p5-Exception-Class>=1.15:${PORTSDIR}/devel/p5-Exception-Class \
		p5-Log-Any>=0.08:${PORTSDIR}/devel/p5-Log-Any \
		p5-Params-Validate>=0.07:${PORTSDIR}/devel/p5-Params-Validate \
		p5-HTML-Parser>0:${PORTSDIR}/www/p5-HTML-Parser

PERL_MODBUILD=	yes
CONFIGURE_ARGS+=	--noprompts

OPTIONS=	MOD_PERL "with mod_perl dependency" off \
		APACHE2 "with mod_perl for Apache 2" off

post-build:
	${MV} -f ${WRKSRC}/bin ${WRKSRC}/bin.orig
	${MV} -f ${WRKSRC}/blib/script ${WRKSRC}/blib/script.orig

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/blib/script.orig/mason.pl ${PREFIX}/bin

.include <bsd.port.pre.mk>

.if defined(WITH_MOD_PERL)
.if defined(WITH_APACHE2)
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Apache2/Request.pm:${PORTSDIR}/www/p5-libapreq2
.else
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Apache/libapreq.pm:${PORTSDIR}/www/p5-libapreq
.endif
.endif

.include <bsd.port.post.mk>
