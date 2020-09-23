PORTNAME=		git-lfs
DISTVERSIONPREFIX=	v
DISTVERSION=		2.10.0
CATEGORIES=		devel

MAINTAINER=	ports@MidightBSD.org
COMMENT=	Git extension for versioning large files

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

RUN_DEPENDS=	git:devel/git

USES=		go:modules
USE_GITHUB=	yes

OPTIONS_DEFINE=		MANPAGES
OPTIONS_DEFAULT=	MANPAGES
OPTIONS_SUB=		yes

NO_TEST=	yes

MANPAGES_BUILD_DEPENDS=	ronn:textproc/rubygem-ronn

post-build-MANPAGES-on:
	cd ${GO_WRKSRC}/docs/man && ${LOCALBASE}/bin/ronn -r *.ronn

post-install-MANPAGES-on:
	${INSTALL_MAN} ${GO_WRKSRC}/docs/man/*.1 ${FAKE_DESTDIR}${LOCALBASE}/man/man1
	${INSTALL_MAN} ${GO_WRKSRC}/docs/man/*.5 ${FAKE_DESTDIR}${LOCALBASE}/man/man5

.include <bsd.port.mk>
