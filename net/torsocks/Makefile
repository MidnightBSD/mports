PORTNAME=	torsocks
DISTVERSION=	2.5.0
CATEGORIES=	net security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy way to make any app work through Tor
WWW=		https://gitlab.torproject.org/tpo/core/torsocks

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/gpl-2.0.txt

USES=		autoreconf gmake libtool tar:xz
USE_LDCONFIG=	${PREFIX}/lib/torsocks

USE_GITLAB=	yes
GL_SITE=	https://gitlab.torproject.org/tpo
GL_ACCOUNT=	core
GL_TAGNAME=	afe9dea542a8b495dbbbbe5e4b98a33cde06729b

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share

INSTALL_TARGET=	install-strip

SUB_FILES=	pkg-message

PORTDOCS=	ChangeLog DEBUG SOCKS5 socks-extensions.txt

OPTIONS_DEFINE=	DOCS

post-build:
	@${ECHO}
	@${ECHO} "Please run 'make check' (requires bash)."
	@${ECHO} "One testcase is known to fail."
	@${ECHO}

post-install:
	${MV} ${PREFIX}/etc/tor/torsocks.conf ${PREFIX}/etc/tor/torsocks.conf.sample

check: build
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} check

# known problems:
# Fails when file fetch is attempted: Resolve destination buffer too small: https://gitlab.torproject.org/tpo/core/torsocks/-/issues/40020

.include <bsd.port.mk>
