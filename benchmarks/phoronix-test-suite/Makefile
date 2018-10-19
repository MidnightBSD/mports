# $MidnightBSD$

PORTNAME=	phoronix-test-suite
DISTVERSIONPREFIX=	v
DISTVERSION=	8.2.0
CATEGORIES=	benchmarks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Phoronix Benchmarking Suite

LICENSE=	gpl3

RUN_DEPENDS=	sudo:security/sudo

USES=		php:cli,build python
USE_GITHUB=	yes
USE_PHP=	curl dom gd json openssl pcntl posix simplexml zip zlib
NO_BUILD=	yes

RUN_DEPENDS+=	fpdf>0:print/fpdf
RUN_DEPENDS+=	cmake:devel/cmake

PORTDATA=	*
PORTDOCS=	*

NO_ARCH=	yes

OPTIONS_DEFINE=	BASH_COMPLETIONS X11 DOCS
OPTIONS_DEFAULT=	X11
OPTIONS_SUB=	yes

BASH_COMPLETIONS_DESC=	Install bash completions
BASH_COMPLETIONS_CONFIGURE_ON=	WITH_BASH_COMPLETIONS=yes
X11_DESC=		Install X11 icons and mimetypes
X11_USES=	desktop-file-utils shared-mime-info
X11_CONFIGURE_OFF=	WITHOUT_X11=yes

post-patch:
	@${SED} -i '' -e "s|/usr/local|${LOCALBASE}|g" \
		${WRKSRC}/phoronix-test-suite \
		${WRKSRC}/pts-core/commands/ob_test_profile_analyze.php \
		${WRKSRC}/pts-core/pts-core.php \
		${WRKSRC}/pts-core/objects/pts_svg_dom_gd.php \
		${WRKSRC}/pts-core/objects/phodevi/components/phodevi_system.php \
		${WRKSRC}/pts-core/objects/client/pts_external_dependencies.php \
		${WRKSRC}/pts-core/objects/client/pts_client.php \
		${WRKSRC}/pts-core/external-test-dependencies/xml/midnightbsd-packages.xml
	@${SED} -i '' -e "s|/usr/share/fonts|${LOCALBASE}/share/fonts| ; \
		s|/usr/X11/lib|${LOCALBASE}/lib|" \
		${WRKSRC}/pts-core/objects/pts_svg_dom_gd.php
	@${SED} -i '' -e "/fpdf.php/s|/usr/share/php|${PREFIX}/share|" \
		${WRKSRC}/pts-core/objects/pts_pdf_template.php

do-install:
	(cd ${WRKSRC} && ${CONFIGURE_ARGS} DESTDIR="${FAKE_DESTDIR}" ./install-sh ${TRUE_PREFIX})

.include <bsd.port.mk>
