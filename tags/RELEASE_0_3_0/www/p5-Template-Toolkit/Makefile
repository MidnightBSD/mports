# $MidnightBSD: mports/www/p5-Template-Toolkit/Makefile,v 1.5 2008/10/11 20:13:25 laffer1 Exp $

PORTNAME=	Template-Toolkit
PORTVERSION=	2.22
CATEGORIES=	www textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extensive Toolkit for template processing
LICENSE=	perl

BUILD_DEPENDS=	\
		${SITE_PERL}/AppConfig.pm:${PORTSDIR}/devel/p5-AppConfig
RUN_DEPENDS=	${BUILD_DEPENDS}

OPTIONS=IMAGE_INFO	"With Image::Info Plugin"		off \
	IMAGE_SIZE	"With Image::Size Plugin"		off \
	DATE_CALC	"With Date::Calc Plugin"		off \
	POD_POM		"With Pod::POM Plugin"			off

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	TT_ACCEPT=y

MASTER_SITE_BACKUP+=	http://www.template-toolkit.org/download/

.include <bsd.port.pre.mk>

.if defined(WITH_IMAGE_INFO)
BUILD_DEPENDS+=${SITE_PERL}/Image/Info.pm:${PORTSDIR}/graphics/p5-Image-Info
.endif
.if defined(WITH_IMAGE_SIZE)
BUILD_DEPENDS+=${SITE_PERL}/Image/Size.pm:${PORTSDIR}/graphics/p5-Image-Size
.endif
.if defined(WITH_DATE_CALC)
BUILD_DEPENDS+=${SITE_PERL}/${PERL_ARCH}/Date/Calc.pm:${PORTSDIR}/devel/p5-Date-Calc
.endif
.if defined(WITH_POD_POM)
BUILD_DEPENDS+=${SITE_PERL}/Pod/POM.pm:${PORTSDIR}/textproc/p5-Pod-POM
.endif

.if defined(BATCH)
CONFIGURE_ENV=	|
.endif

.include "Makefile.man"

post-patch:
	${PERL} -pi -e 's,/usr/local/tt2,${TARGETDIR}/share/tt2,g' \
		${CONFIGURE_WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.post.mk>
